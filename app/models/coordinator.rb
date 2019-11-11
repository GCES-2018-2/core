# frozen_string_literal: true

# Coordinator class
class Coordinator < ApplicationRecord
  belongs_to :course
  belongs_to :user, optional: true
  has_many :school_rooms, dependent: :destroy
end
