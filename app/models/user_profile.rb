class UserProfile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }

  def full_name
    [self.first_name, self.last_name].join(' ')
  end
end
