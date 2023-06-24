# frozen_string_literal: true

class Employee < ApplicationRecord
  validates :name, :email, :register_number, :cpf, presence: true

  belongs_to :role

  # ransack attributes
  def self.ransackable_attributes(_auth_object = nil)
    %w[name email register_number cpf role_name]
  end
end
