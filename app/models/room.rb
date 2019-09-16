# frozen_string_literal: true

# Model of room
class Room < ApplicationRecord
  belongs_to :building
  has_many :allocations, dependent: :destroy
  belongs_to :department
  has_and_belongs_to_many :category
  belongs_to :department

  # Room code
  validates :code,
            presence: { message: 'Informe o código da sala' },
            uniqueness: { message: 'Uma sala com esse código já foi cadastra' }

  # Room name
  CHARACTERS_MINIMUM_FOR_THE_NAME_EXCEPTION = 'O Nome deve ter no mínimo 2
   caracteres'.freeze
  CHARACTERS_MAXIMUM_FOR_THE_NAME_EXCEPTION = 'Nome deve ter no máximo 50
   caracters'.freeze

  validates_length_of :name,
                      within: 2..50,
                      too_short: CHARACTERS_MINIMUM_FOR_THE_NAME_EXCEPTION,
                      too_long: CHARACTERS_MAXIMUM_FOR_THE_NAME_EXCEPTION

  # Room details
  CHARACTERS_MAXIMUM_FOR_THE_DETAILS_EXCEPTION = 'As observações devem conter no maximo
  150 caracteres'.freeze

  validates_length_of :details,
                      within: 0..150,
                      too_long: CHARACTERS_MAXIMUM_FOR_THE_DETAILS_EXCEPTION

  # Room capacity
  MINIMUM_FOR_THE_CAPACITY_EXCEPTION = 'A capacidade mínima é 5 vagas'.freeze
  MAXIMUM_FOR_THE_CAPACITY_EXCEPTION = 'A capacidade máxima é 500 vagas'.freeze

  validates_numericality_of :capacity,
                            greater_than_or_equal_to: 5,
                            message: MINIMUM_FOR_THE_CAPACITY_EXCEPTION

  validates_numericality_of :capacity,
                            less_than_or_equal_to: 500,
                            message: MAXIMUM_FOR_THE_CAPACITY_EXCEPTION

  self.per_page = 10


  has_one_attached :photo
end
