class Composer < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  def missing_first_name
    name.split.length == 1
  end
end
