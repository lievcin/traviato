class Composer < ActiveRecord::Base
  validates :name, presence: true

  def missing_first_name
    name.split.length == 1
  end
end
