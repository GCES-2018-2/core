# frozen_string_literal: true

# class that controller the actions of a user
class UsersController < ApplicationController
  require_relative '../../lib/modules/user_util.rb'
  require_relative '../../lib/modules/user_module.rb'
  before_action :logged_in?

  def show
    @user = User.friendly.find(params[:id])
    @school_room_count = school_rooms_by_user.count
    @school_rooms_allocated_count = school_rooms_allocated_count
    @periods = Period.all
    department = departments_by_user(current_user.id)
    @solicitation_count = RoomSolicitation.where(department: department)
                                          .where(status: 0)
                                          .group(:solicitation_id, :room_id).size

    return unless @user.id != current_user.id && permission[:level] != 2
    redirect_to_current_user
  end

  def index
    @users = User.where('id != ? and active = 1', current_user.id)
    return unless permission[:level] != 2
    redirect_to_current_user
  end

  def edit
    @user = User.friendly.find(params[:id])
    return unless @user.id != current_user.id
    redirect_to_current_user
  end

  def update
    @user = User.friendly.find(params[:id])
    if @user.update_attributes(validate_user_params)
      redirect_to user_path
      flash[:success] = 'Dados atualizados com sucesso'
    else
      redirect_to user_edit_path
      flash[:warning] = 'Dados não foram atualizados'
    end
  end

  def destroy
    @user = User.friendly.find(params[:id])
    if @user.id == current_user.id
      give_permission_to_destroy
    else
      flash[:error] = 'Acesso Negado'
      redirect_back fallback_location: { action: 'show', id: current_user.id }
    end
  end

  def give_permission_to_destroy
    if permission[:level] == 2 && AdministrativeAssistant.joins(:user)
                                                         .where(users: { active: true })
                                                         .count == 1
      flash[:error] = 'Não é possível excluir o único assistante Administrativo'
      redirect_to current_user
    else
      @user.update(active: 2)
      flash[:success] = 'Usuário excluído com sucesso'
      redirect_to login_path
    end
  end

  private

  def validate_user_params
    verifyCoordinator
  end

  def redirect_to_current_user
    redirect_back fallback_location: { action: 'show', id: current_user.id }
  end
end
