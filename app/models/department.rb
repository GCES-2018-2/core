# frozen_string_literal: true

# Classe Departamento
class Department < ApplicationRecord
  has_many :disciplines, dependent: :destroy
  has_many :room_solicitation, dependent: :destroy
  has_many :courses
  belongs_to :campus
end
