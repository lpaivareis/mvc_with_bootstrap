# frozen_string_literal: true

class Role < ApplicationRecord
  validates :name, presence: true

  has_many :employees, dependent: :destroy

  def self.ransackable_attributes(_auth_object = nil)
    %w[name] + _ransackers.keys
  end

  def self.ransackable_associations(_auth_object = nil)
    super + %w[employees]
  end
end
