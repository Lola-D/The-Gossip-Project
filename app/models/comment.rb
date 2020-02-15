class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 200 }

  belongs_to :gossip
  belongs_to :user
  has_many :likes, as: :content
  has_many :comment_of_comments
end
