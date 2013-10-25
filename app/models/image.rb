class Image < ActiveRecord::Base
  validates :title, presence: true;
  belongs_to :event
  mount_uploader :title, ImageUploader
end
