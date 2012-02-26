require 'dropbox_sdk'
class Site < ActiveRecord::Base
  after_create :create_heroku_domain,:create_dropbox_folder
  belongs_to :owner, :class_name =>"User"
  validates :dropbox_folder, :presence => true
  has_one :domain
  accepts_nested_attributes_for :domain

  
  def create_heroku_domain
    heroku = Heroku::Client.new(ENV['HEROKU_USERNAME'],ENV['HEROKU_PASSWORD'])
    puts "Adding #"+self.domain.to_s
    heroku.add_domain(ENV['DROPLAMP_SERVER'],self.domain.to_s) if Rails.env.eql? 'production'  
  end
  def refresh
    Resque.enqueue(RunJekyll,self.id) 
  end
  def create_dropbox_folder
    Dir["#{Rails.root}/templates/default/**/**"].each do |file|
      next if File.directory?(file)
      to_path=self.dropbox_folder+file.sub("#{Rails.root}/templates/default","")
      puts "putting "+to_path
      dropbox.put_file( to_path,File.new(file,"r") )
    end
  end
  def dropbox
   @dropbox ||= begin
    session=DropboxSession.new(ENV['DROPBOX_KEY'], ENV['DROPBOX_SECRET'])
    session.set_access_token(self.owner.dropbox_token,self.owner.dropbox_token_secret)
    dropbox=DropboxClient.new(session,:app_folder)
    dropbox 
   end
  end

end


