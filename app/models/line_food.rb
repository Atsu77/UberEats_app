class LineFoods < ApplicationRecord
  belongs_to :food
  belongs_to :restaurant
  belongs_to :order, optional: true

  validate :count, numericality: {greater_than: 0}

  scope :active, -> {where(active: true)}
  scope :other_restaurants, -> (picked_restaurant_id){where.not(restaurant_id: picked_restaurant_id)}

  def total_amount
    food.price * count
  end
end