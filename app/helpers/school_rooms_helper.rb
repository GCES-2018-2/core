# frozen_string_literal: true

# school room module
module SchoolRoomsHelper
  def discipline_of_department(id)
    Discipline.where(department_id: id).load
  end

  def get_name(id)
    SchoolRoom.find_by(id: id).name
  end

  def get_discipline_name(id)
    SchoolRoom.find_by(id: id).discipline.name
  end

  def get_department_name(id)
    SchoolRoom.find_by(id: id).discipline.department.name
  end

  def get_vacancies(id)
    SchoolRoom.find_by(id: id).vacancies
  end

  def get_courses(id)
    SchoolRoom.find_by(id: id).courses
  end

  def get_categories(id)
    SchoolRoom.find_by(id: id).category
  end

  def school_rooms_of_disciplines(disciplines)
    SchoolRoom.where(discipline: disciplines).order(:name)
  end

  def current_coordinator_by_id
    Coordinator.find_by(user_id: current_user.id)
  end

  def schoolroom_by_id
    SchoolRoom.find(params[:id])
  end

  def schoolrooms_by_coordinator
    SchoolRoom.joins(:coordinator).where(coordinators: { id: current_user.coordinator.id })
  end

  def department_by_coordinator
    coordinator = Coordinator.find_by(user: current_user.id)
    course = Course.find(coordinator.course_id)
    Department.find(course.department_id)
  end

  def coordinator_buildings
    Building.joins(:rooms)
            .where(rooms: { department: Department
            .find_by(id: department_by_coordinator) })
            .distinct
  end

  def allocated?(id)
    !Allocation.find_by(school_room_id: id).nil?
  end

  def allocated_school_rooms
    @allocated_school_rooms = []
    @school_rooms.each do |school_room|
      @allocated_school_rooms << school_room if allocated? school_room.id
    end
    @allocated_school_rooms
  end

  def unallocated_school_rooms
    @unallocated_school_rooms = []
    @school_rooms.each do |school_room|
      @unallocated_school_rooms << school_room unless allocated? school_room.id
    end
    @unallocated_school_rooms
  end

  def school_rooms_by_allocation(allocation)
    if !@school_rooms.nil?
      if allocation == 'Alocadas'
        @school_rooms = allocated_school_rooms
      elsif allocation == 'Desalocadas'
        @school_rooms = unallocated_school_rooms
      end
    else
      @school_rooms = @my_school_rooms
    end
    @school_rooms
  end

  def check_if_school_rooms_can_be_removed
    coordinator = current_coordinator_by_id
    roomdepartment = @school_room.discipline.department
    flash[:success] = if permission[:level] == 1 && coordinator.course.department == roomdepartment
                        @school_room.destroy
                        'A turma foi excluída com sucesso'
                      else
                        'Permissão negada'
                      end
  end

  def check_if_school_rooms_can_be_updated
    if @school_room.update_attributes(school_rooms_params_update)
      success_message = 'A turma foi alterada com sucesso'
      redirect_to school_rooms_index_path, flash: { success: success_message }
    else
      ocurred_errors(@school_room)
      render :edit
    end
  end
end
