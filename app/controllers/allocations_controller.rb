require 'will_paginate/array'

# frozen_string_literal: true

# rubocop:disable ClassLength
# class that create allocations

# Allocations Controller
class AllocationsController < ApplicationController
  require_relative '../../lib/modules/rooms_util.rb'

  include DateAllocationHelper
  include AllocationHelper
  include FiltersRoomsHelper

  before_action :logged_in?
  before_action :authenticate_coordinator?

  def new
    @days = %w[Segunda Terça Quarta Quinta Sexta Sábado]
    @hours = %w[06:00 08:00 10:00 12:00 14:00 16:00]
    @allocations = []
    84.times do
      @allocations << Allocation.new
    end

    @school_room = SchoolRoom.find(params[:school_room_id])
    @buildings = Building.all
    @campi = Campus.all
    @rooms = Room.all

    @coordinator_rooms = current_user.coordinator.course.department.rooms
    filtering_params_allocations
  end

  def search_by_filters
    @coordinator_rooms = search_rooms_by_capacity(@coordinator_rooms,
                                                  @main_rooms_coordinator,
                                                  params[:capacity_filter])
    @coordinator_rooms = search_rooms_by_resources
    @coordinator_rooms = search_rooms_by_building(@coordinator_rooms,
                                                  @main_rooms_coordinator,
                                                  params[:building_filter])
    @coordinator_rooms = search_rooms_by_day
    @coordinator_rooms = search_rooms_by_schedule
    @coordinator_rooms = search_rooms_by_name(@coordinator_rooms,
                                              @main_rooms_coordinator,
                                              params[:room_filter])
  end

  def filtering_params_allocations
    params.slice(params[:capacity_filter],
                 params[:resources_filter],
                 params[:building_filter],
                 params[:days_filter],
                 params[:schedule_filter],
                 params[:room_filter])
    @main_rooms_coordinator = @coordinator_rooms
    search_by_filters
    @coordinator_rooms = @coordinator_rooms.paginate(page: params[:page], per_page: 5)
  end

  def create
    allocations_params = get_valid_allocations_params(params)
    return redirect_to :back unless allocations_params.present?
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
    (6..18).each do |hour|
      data << make_rows(hour)
    end
    render inline: data.to_json
  end

  private

  def get_valid_allocations_params(params, group_allocation = [], valid = [])
    [:Segunda, :Terça, :Quarta, :Quinta, :Sexta, :Sábado].each do |day_of_week|
      exist = false
      ('6'..'18').to_a.each do |index|
        next if params[day_of_week][index].nil?
        if params[day_of_week][index][:active] == '1' && !exist
          group_allocation.push params[day_of_week][index]
          valid.push index
          valid.push day_of_week
          exist = true
        elsif params[day_of_week][index][:active] == '1'
          group_allocation.last[:final_time] = params[day_of_week][index][:final_time]
        else
          exist = false
        end
      end
    end
    group_allocation
  end

  def pass_to_all_allocation_dates(allocation)
    pass_to_all_allocations_helper(allocation)
  end

  # rubocop:disable Metrics/LineLength
  def allocations_params(my_params)
    my_params.permit(:room_id,
                     :school_room_id,
                     :day,
                     :start_time,
                     :final_time,
                     :active)
  end

  def make_rows(hour)
    @row = [hour.to_s + ':00']
    %w[Segunda Terça Quarta Quinta Sexta Sabado].each do |day_of_week|
      @first_time = (hour.to_s + ':00').to_time
      @second_time = (hour.to_s + ':00').to_time
      allocations = Allocation.where(room_id: params[day_of_week]).where(day: day_of_week)
      allocations_start = allocations.where(start_time: @first_time)
                                     .where(final_time: @second_time)
      make_cell(allocations_start, hour, Room.find(params[day_of_week].to_i))
    end
    @row
  end

  def make_cell(allocations_start, hour, room)
    cell = ''
    if allocations_start.size.zero?
      cell = ' '
    else
      cell = ''
      exist = false
      allocations_start.each do |allocation|
        cell += allocation.school_room.discipline.name unless exist
        cell += '<br>Turma:' +
                allocation.school_room.name
        exist = true
      end
    end
    data_allocation(cell, hour, room)
  end

  def data_allocation(cell, hour, room)
    data_allocation = []
    data_allocation.push cell
    data_allocation.push params[:school_room]
    data_allocation.push room.id
    data_allocation.push hour.to_s
    data_allocation.push((hour + 1).to_s)
    data_allocation.push SchoolRoom.find(params[:school_room]).courses.first.shift
    @row << data_allocation
  end

  # rubocop:enable Metrics/MethodLength, Metrics/BlockLength, Metrics/AbcSize
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/LineLength
end
# rubocop:enable ClassLength
