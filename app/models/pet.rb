class Pet < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :name
  attribute :adoption_status, :boolean, default: true


  def self.order_by_adoption_status
    order("adoption_status DESC NULLS LAST ")
  end

end
