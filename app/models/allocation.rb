# frozen_string_literal: true

# class that create allocations
class Allocation < ApplicationRecord
  belongs_to :room
  belongs_to :school_room
  belongs_to :user
  has_many :all_allocation_date, dependent: :destroy
  @final_value = 24

  validates :school_room_id,
            presence: { message: 'Informe a Turma' }
  validates :room_id,
            presence: { message: 'Informe a Sala' }
  validates :start_time,
            presence: { message: 'Informe a hora de inicio' }
  validates :final_time,
            presence: { message: 'Informe a hora de términio' }

  validate :validate_hours

  def verify_time(room)
    allocations_room = room
    start = start_time.strftime('%H').to_i
    final = final_time.strftime('%H').to_i
    final = @final_value if final.zero?

    allocations_room.each do |allocation|
      return true if time_in_range(allocation, start, final)
    end
    false
  end

  def validate_hours
    school_allocated = 'Turma já alocada neste horário'
    error_mensager = 'Alocação com horário não vago ou capacidade da sala cheia'
    errors.add(:start_time, error_mensager) if verify_time_shock_room_day
    errors.add(:start_time, school_allocated) if verify_same_school_room_schock
  end

  def verify_time_shock_room_day
    verify_time(Allocation.where(day: day, room_id: room_id))
  end

  def verify_same_school_room_schock
    verify_time(Allocation.where(day: day, school_room_id: school_room_id))
  end

  def time_in_range(allocation, start, final)
    allocation_start = allocation.start_time.strftime('%H').to_i
    allocation_final = allocation.final_time.strftime('%H').to_i
    allocation_final = @final_value if allocation_final.zero?
    (start >= allocation_start && start < allocation_final) ||
      (final > allocation_start && final <= allocation_final)
  end
end
