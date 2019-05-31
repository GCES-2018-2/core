# frozen_string_literal: true

# Campus class
class Campus < ApplicationRecord
  has_many :departments, dependent: :destroy
end
