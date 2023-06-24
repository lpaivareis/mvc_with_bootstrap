# frozen_string_literal: true

class Employee < ApplicationRecord
  validates :name, :email, :register_number, :cpf, presence: true

  belongs_to :role

  def self.ransackable_attributes(_auth_object = nil)
    %w[name email register_number cpf] + _ransackers.keys
  end

  def self.ransackable_associations(_auth_object = nil)
    super + %w[role]
  end
end
