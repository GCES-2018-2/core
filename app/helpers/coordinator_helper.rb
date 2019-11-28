# frozen_string_literal: true

# coordinator module
module CoordinatorHelper
  include SessionsHelper

  def courses_by_coordinator
    case permission[:level]
    when 1
      @coordinator = coordinator_by_user(session[:user_id])
      @courses = Course.find_by(id: @coordinator.course_id)
    end
  end

  def disciplines_by_coordinator(user)
    coordinator = coordinator_by_user(user.id)
    course = Course.find(coordinator.course_id)
    departments = Department.where(id: course.department_id).select('id')
    disciplines = Discipline.where(department_id: departments)
    disciplines
  end
end
