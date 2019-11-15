# frozen_string_literal: true

# Module to attributes from coordinator
module UserHelper
  def coordinator_by_user(user_id)
    Coordinator.find_by(user_id: user_id)
  end

  def deg_by_user(user_id)
	Deg.find_by(user_id: user_id)
  end

  def administrativeassistant_by_user(user_id)
    AdministrativeAssistant.find_by(user_id: user_id)
  end

  def departments_by_user(user)
    coordinator = coordinator_by_user(user.id)
    if coordinator.nil?
      Department.find_by(name: 'PRC')
    else
      coordinator.course.department
    end
  end
end
