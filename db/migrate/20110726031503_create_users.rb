class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :dropbox_token
      t.string :dropbox_token_secret

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
