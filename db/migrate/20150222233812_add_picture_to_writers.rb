class AddPictureToWriters < ActiveRecord::Migration
  def change
    add_column :picture, :string
  end
end