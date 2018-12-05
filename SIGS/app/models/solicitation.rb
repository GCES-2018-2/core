# frozen_string_literal: true

# Class to save requester solicitation
class Solicitation < ApplicationRecord
  has_many :room_solicitation
  belongs_to :requester, class_name: 'User'
  belongs_to :school_room

  # Not null values
  validates_presence_of :justify, message: 'A solicitação deve conter uma justificativa'
  validates_presence_of :request_date, message: 'Data de solicitação inválida'
  validates_presence_of :requester, message: 'Usuário solicitante inválido'
  validates_presence_of :school_room, message: 'Selecione a turma da solicitação'

  validates :requester, requester: true
end
