class Gossip < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 200 }

  belongs_to :user
  has_many :join_gossip_tags
  has_many :tags, through: :join_gossip_tags
  has_many :likes, as: :content
  has_many :comments
end
