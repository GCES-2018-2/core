# frozen_string_literal: true

# Classe modelo da Sala
class Period < ApplicationRecord
  validates :final_date, final_date: true
end
