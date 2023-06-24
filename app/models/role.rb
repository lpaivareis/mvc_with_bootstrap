# frozen_string_literal: true

class Role < ApplicationRecord
  validates :name, presence: true

  has_many :employees, dependent: :destroy
end
