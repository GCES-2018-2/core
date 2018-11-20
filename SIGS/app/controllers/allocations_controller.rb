# frozen_string_literal: true

# class that create allocations
class AllocationsController < ApplicationController
  require_relative '../../lib/modules/allocations_module.rb'
  before_action :logged_in?
  before_action :authenticate_coordinator?
  include DateAllocationHelper

  def new
    @allocations = []
    84.times do
      @allocations << Allocation.new
    end
    @school_room = SchoolRoom.find(params[:school_room_id])
    @coordinator_rooms = current_user.coordinator.course.department.rooms
  end

  def create
    allocations_params = get_valid_allocations_params(params)
    allocations_params.each do |allocation_param|
      save_allocation(allocation_param)
    end
    school_room_id = allocations_params.first[:school_room_id]
    redirect_to allocations_new_path(school_room_id)
  end

  def destroy
    @allocation_all_date_user = []
    @school_room = SchoolRoom.find(params[:id])
    @allocation_all_user = Allocation.where(school_room_id: @school_room.id)
    @allocation_all_user.each do |allocation|
      @allocation_all_date_user += AllAllocationDate.where(allocation_id: allocation.id)
    end
  end

  # rubocop:enable Metrics/MethodLength, Metrics/BlockLength, Metrics/AbcSize
  # rubocop:enable Metrics/LineLength
  # rubocop:enable Style/WordArray, Style/MultilineArrayBraceLayout

  def destroy_all_allocations
    school_room_id = SchoolRoom.find(params[:id]).id
    allocations_sh = Allocation.where(school_room_id: school_room_id)
    allocations_sh.each(&:destroy)
    flash[:success] = 'Desalocação feita com sucesso'
    redirect_to allocations_destroy_path(school_room_id)
  end

  def destroy_all_allocation_date
    @all_allocation_date_delete = AllAllocationDate.find(params[:id])
    @school_room = SchoolRoom.find_by(
      id: @all_allocation_date_delete.allocation.school_room.id
    )
    @all_allocation_date_delete.destroy
    flash[:success] = 'Desalocação feita com sucesso'
    redirect_to allocations_destroy_path(@school_room.id)
  end

  def room_allocations_by_day
    require 'json'

    data = []
    (6..23).each do |hour|
      data << make_rows(hour)
    end
    render inline: data.to_json
  end

  private

  def save_allocation(allocation)
    new_allocation = Allocation.new(allocations_params(allocation))
    return unless new_allocation.active
    new_allocation.user_id = current_user.id

    if new_allocation.save
      pass_to_all_allocation_dates(new_allocation)
      flash[:success] = 'Alocação feita com sucesso'
    else
      ocurred_errors(new_allocation)
    end
  end

  def pass_to_all_allocation_dates(allocation)
    pass_to_all_allocations_helper(allocation)
  end

  def allocations_params(my_params)
    my_params.permit(:room_id,
                     :school_room_id,
                     :day,
                     :start_time,
                     :final_time,
                     :active)
  end

  # rubocop:enable Metrics/MethodLength, Metrics/BlockLength, Metrics/AbcSize
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/LineLength
end
# rubocop:enable ClassLength
