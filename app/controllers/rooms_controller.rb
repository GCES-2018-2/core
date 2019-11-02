# frozen_string_literal: true

# rooms controller
class RoomsController < ApplicationController
  require 'will_paginate/array'
  include FiltersRoomsHelper
  before_action :logged_in?
  before_action :authenticate_not_deg?, except: [:index, :show]

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = 'Sala criada'
    else
      flash[:error] = 'Não foi possível criar sala. Sala já registrada
                       ou campo de preenchimento estava vazio.'
    end
    redirect_to room_index_path
  end

  def index
    @all_rooms = Room.all
    @buildings = Building.all
    @department = Department.all
    @user_department = find_user_department
    @campi = Campus.all
    search_by_filters_rooms
  end

  def apply_filters
    @all_rooms = search_rooms_by_campus(@all_rooms, @main_rooms, params[:campus_id])
    @all_rooms = search_rooms_by_capacity(@all_rooms, @main_rooms,
                                          params[:capacity_range])
    @all_rooms = search_rooms_by_building(@all_rooms, @main_rooms, params[:building_id])
    @all_rooms = search_rooms_by_name(@all_rooms, @main_rooms, params[:room_id])
    @all_rooms = search_rooms_by_code(@all_rooms, @main_rooms, params[:code_selected])
    @all_rooms = search_rooms_by_department(@all_rooms, @main_rooms,
                                            params[:department_id])
  end

  def search_by_filters_rooms
    @main_rooms = @all_rooms
    apply_filters
    @rooms = @all_rooms.paginate(page: params[:page], per_page: 15)
  end

  def find_user_department
    if current_user.coordinator.nil?
      nil
    else
      current_user.coordinator.course.department
    end
  end

  def edit
    find_rooms
  end

  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(room_params)
      success_message = 'Dados da sala atualizados com sucesso'
      redirect_to room_index_path(@room.id), flash: { success: success_message }
    else
      flash[:error] = 'Dados não foram atualizados'
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @coordinator = Coordinator.find_by(user_id: current_user.id)
    if permission[:level] == 2
      @room.destroy
      flash[:success] = 'Sala excluída com sucesso'
    else
      flash[:error] = 'Não possui permissão para excluir sala'
    end
    redirect_to room_index_path(@room_index)
  end

  def show
    find_rooms
  end

  def json_of_categories_by_school_room
    school_room_id = params[:school_room_id]
    result = []
    allocations = Allocation.where(school_room_id: school_room_id)
    allocations.each do |allocation|
      result.push [allocation.start_time,
                   allocation.final_time,
                   allocation.day,
                   allocation.room.name]
    end
    render inline: result.to_json
  end

  private

  def find_rooms
    @room = Room.find(params[:id])
    @room_categories = @room.category
    find_allocation(@room)
  end

  def find_allocation(room)
    room_id = room.id
    @allocations = Allocation.where(room_id: room_id)
    @allocations_extensions = AllocationExtension.where(room_id: room_id)
  end

  def room_params
    params[:room].permit(
      :id,
      :code,
      :name,
      :capacity,
      :active,
      :time_grid_id,
      :building_id,
      :course_id,
      :campus_id,
      :details,
      :photo,
      category_ids: []
    )
  end
end
