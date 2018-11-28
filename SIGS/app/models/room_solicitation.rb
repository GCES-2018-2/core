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

  validates :start, start:true

  #def validate_hours
    #errors.add(:start, 'Horários Inválidos') if time_invalid
    #error_mensager = 'Alocação com horário não vago ou capacidade da sala cheia'
    #errors.add(:start, error_mensager) if verify_time_shock_room_day
  #end

end
