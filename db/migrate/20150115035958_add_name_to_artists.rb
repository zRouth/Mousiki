class AddNameToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :name, :string
    add_column :artists, :date, :string
    add_column :artists, :time, :string
    add_column :artists, :venue, :string
  end
end
