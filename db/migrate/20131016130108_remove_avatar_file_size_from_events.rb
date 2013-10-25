class RemoveAvatarFileSizeFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :avatar_file_size, :integer
    remove_column :events, :avatar_updated_at, :datetime
  end
end
