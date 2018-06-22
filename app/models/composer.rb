class Composer < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :works, inverse_of: :composer
end
