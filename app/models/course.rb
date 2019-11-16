# frozen_string_literal: true

# Classe Curso
class Course < ApplicationRecord
  has_and_belongs_to_many :disciplines
  has_one :coordinator, dependent: :destroy
  has_and_belongs_to_many :school_rooms
  has_many :rooms, dependent: :destroy
  has_many :room_solicitation, dependent: :destroy
  belongs_to :department
end
