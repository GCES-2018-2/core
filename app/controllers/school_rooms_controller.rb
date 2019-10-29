# frozen_string_literal: true

# school rooms controller
class SchoolRoomsController < ApplicationController
  before_action :logged_in?
  before_action :authenticate_coordinator?, except: [:index]
  require 'will_paginate/array'

  def new
    @school_room = SchoolRoom.new
    @all_courses = Course.all
  end

  def create
    @school_room = SchoolRoom.new(school_rooms_params)
	  @school_room.name.upcase!
	  @school_room.coordinator_id = current_user.coordinator.id
    @all_courses = Course.all
    if @school_room.save
      redirect_to school_rooms_index_path, flash: { success: 'Turma criada' }
    else
      ocurred_errors(@school_room)
      render :new
    end
  end

  def edit
    @school_room = SchoolRoom.find(params[:id])
    @all_courses = Course.all
  end

  def index
    if permission[:level] == 1
	    @my_school_rooms = SchoolRoom.joins(:coordinator).where(coordinators: { id: current_user.coordinator.id})
    else
      @my_school_rooms = SchoolRoom.all
    end
    filtering_params
  end

  def search_disciplines
    @school_rooms = SchoolRoom.joins(:discipline)
                              .where('disciplines.name LIKE ?',
                                     "%#{params[:discipline_selected]}%")
  end

  def search_allocations
    @school_rooms = school_rooms_by_allocation(params[:allocation_selected])
  end

  def filtering_params
    @school_rooms = @my_school_rooms

    @school_rooms = search_disciplines
    @school_rooms = search_allocations

    @my_school_rooms = @school_rooms.paginate(page: params[:page], per_page: 10)
  end

  def search_courses
    require 'json'
    search_param = params[:code]

    if search_param == 'GET_ALL'
      courses = Course.all
    else
      courses = Course
                .where('name LIKE ? OR code LIKE ?', "%#{search_param}%", "%#{search_param}%")
    end
    render inline: courses.to_json
  end

  def update
    @school_room = SchoolRoom.find(params[:id])
    @all_courses = Course.all
    if @school_room.update_attributes(school_rooms_params_update)
      success_message = 'A turma foi alterada com sucesso'
      redirect_to school_rooms_index_path, flash: { success: success_message }
    else
      ocurred_errors(@school_room)
      render :edit
    end
  end

  def destroy
    @school_room = SchoolRoom.find(params[:id])
    coordinator = Coordinator.find_by(user_id: current_user.id)
    if permission[:level] == 1 &&
       coordinator.course.department == @school_room.discipline.department
      @school_room.destroy
      flash[:success] = 'A turma foi excluída com sucesso'
    else
      flash[:error] = 'Permissão negada'
    end
    redirect_to school_rooms_index_path
  end

  private

  def school_rooms_params
    params[:school_room].permit(
      :name,
      :discipline_id,
      :vacancies,
      course_ids: [],
      category_ids: []
    )
  end

  def school_rooms_params_update
    params[:school_room].permit(
      :discipline_id,
      :vacancies,
      course_ids: [],
      category_ids: []
    )
  end
end
