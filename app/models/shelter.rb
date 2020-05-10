class Shelter < ApplicationRecord
  has_many :pets,
  dependent: :destroy
  validates_presence_of :name

  def pet_count
    pets.count
  end

  def self.order_by_num_adopatable
    joins(:pets)
    .group(:id)
    .order("name DESC")
  end

  def self.order_by_name
    order("name")
  end

end
