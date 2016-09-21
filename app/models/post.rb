class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, :content, :presence => true
  has_attached_file :image, styles: { medium: "300x300" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
