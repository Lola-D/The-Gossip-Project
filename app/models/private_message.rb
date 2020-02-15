class PrivateMessage < ApplicationRecord
  validates :content, presence: true

  belongs_to :sender, class_name: "User"
  has_many :join_private_message_receivers
  has_many :recipients, through: :join_private_message_receivers
end
