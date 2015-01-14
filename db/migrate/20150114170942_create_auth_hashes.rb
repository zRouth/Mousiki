class CreateAuthHashes < ActiveRecord::Migration
  def change
    create_table :auth_hashes do |t|
      t.string :provider

      t.timestamps
    end
  end
end
