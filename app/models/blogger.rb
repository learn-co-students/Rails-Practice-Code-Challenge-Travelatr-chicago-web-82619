class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts
  validates :name, uniqueness: true
  validate :validate_age

  def validate_age
    if self.age < 1
      # self.shell_size.round
      self.errors.add(:age, "must be greater than 0")
    end
  end
end
