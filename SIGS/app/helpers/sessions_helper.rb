# frozen_string_literal: true

# Module to check the permission level on pages
module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def permission
    session_user_id = session[:user_id]
    has_deg_user = Deg.find_by(user_id: session_user_id)
    if has_deg_user
      level_deg = 0
      @permission ||= { level: level_deg, type: 'Deg' }
      return
    end

    has_coordinator_user = Coordinator.find_by(user_id: session_user_id)
    if has_coordinator_user
      level_coordinator = 1
      @permission ||= { level: level_coordinator, type: 'Coordinator' }
      return
    end

    has_admin_assistant = AdministrativeAssistant.find_by(user_id: session_user_id)
    if has_admin_assistant 
      level_admin_assistant = 2
      @permission ||= { level: level_admin_assistant, type: 'Administrative Assistant' }
    end
  end

  def logged_in?
    return unless current_user.nil?
    flash.now[:notice] = 'Você precisa estar logado'
    render 'sessions/login'
  end

  def current_user_department
    coordinator = Coordinator.find_by(user_id: current_user.id)
    if coordinator.nil?
      Department.find_by(name: 'PRC')
    else
      coordinator.course.department
    end
  end

  def authenticate_coordinator?
    return unless permission[:level] != 1
    flash[:error] = 'Acesso Negado'
    redirect_to current_user
  end

  def authenticate_administrative_assistant?
    return unless permission[:level] != 2
    flash[:error] = 'Acesso Negado'
    redirect_to current_user
  end

  def authenticate_not_deg?
    return unless permission[:level].zero?
    flash[:error] = 'Acesso Negado'
    redirect_to current_user
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
    @permission = nil
  end
end
