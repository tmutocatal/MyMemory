class AddBodyToImages < ActiveRecord::Migration
  def change
    add_column :images, :body, :string
  end
end
