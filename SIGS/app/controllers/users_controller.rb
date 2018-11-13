# frozen_string_literal: true

# class that controller the actions of a user
class UsersController < ApplicationController
  require_relative '../../lib/modules/user_module.rb'
  before_action :logged_in?
  before_action :set_user, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @school_room_count = school_rooms_by_user.count
    @school_rooms_allocated_count = school_rooms_allocated_count
    @periods = Period.all
    department = current_user_department
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
    return unless @user.id != current_user.id
    redirect_to_current_user
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path
      flash[:success] = 'Dados atualizados com sucesso'
    else
      redirect_to user_edit_path
      flash[:warning] = 'Dados não foram atualizados'
    end
  end

  def handle_destroy
    if permission[:level] == 2 && AdministrativeAssistant.only_one?
      flash[:error] = 'Não é possível excluir o único assistante Administrativo'
      redirect_to current_user
    else
      @user.update(active: 2)
      flash[:success] = 'Usuário excluído com sucesso'
      redirect_to login_path
    end
  end

  def destroy
    if @user.id == current_user.id
      handle_destroy
    else
      flash[:error] = 'Acesso Negado'
      redirect_back fallback_location: { action: 'show', id: current_user.id }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    if params[:type] == 'coordinator'
      params[:user].permit(:id, :name, :email, :password, :registration,
                           :cpf, :active, :image,
                           coordinator_attributes: [:course_id, :user_id])
    else
      params[:user].permit(:id, :name, :email, :password, :registration,
                           :cpf, :active, :image)
    end
  end

  def redirect_to_current_user
    redirect_back fallback_location: { action: 'show', id: current_user.id }
  end
end
