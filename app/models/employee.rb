# frozen_string_literal: true

class Employee < ApplicationRecord
  validates :name, :email, :register_number, :cpf, presence: true
end
