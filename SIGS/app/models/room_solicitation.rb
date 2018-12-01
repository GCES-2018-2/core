# frozen_string_literal: true

# Class t save responder solicitation
class RoomSolicitation < ApplicationRecord
  belongs_to :solicitation
  belongs_to :responder, class_name: 'User', optional: true
  belongs_to :room, optional: true
  belongs_to :department, optional: true

  # Not null values
  validates_presence_of :start, message: 'Indique o horário de início'
  validates_presence_of :final, message: 'Indique o horário de término'
  validates_presence_of :solicitation, message: 'Solicitação Inválida'

  validates :start, start: true
end
