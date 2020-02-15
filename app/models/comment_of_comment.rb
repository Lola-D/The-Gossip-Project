class CommentOfComment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 200 }

  belongs_to :comment
  belongs_to :user
end
