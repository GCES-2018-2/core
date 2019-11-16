# frozen_string_literal: true

# Classe Departamento
class Department < ApplicationRecord
  has_many :disciplines, dependent: :destroy
  has_many :courses
  has_many :coordinators
  belongs_to :campus
end
