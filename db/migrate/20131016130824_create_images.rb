class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.boolean :done, default: false
      t.references :event, index: true

      t.timestamps
    end
  end
end
