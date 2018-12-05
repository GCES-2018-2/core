# frozen_string_literal: true

# class that controller the actions of a user
class UsersController < ApplicationController
  require_relative '../../lib/modules/user_util.rb'
  require_relative '../../lib/modules/user_module.rb'
  before_action :logged_in?

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

  def create
    @user = User.new(user_params)
    if @user.save
      verify_user_save
    else
      @user.build_deg
      @user.build_coordinator
      @user.build_administrative_assistant
      render :new
    end
  end

  def verify_user_save
    if params[:type] == 'deg'
      @deg = Deg.create(user: @user)
    elsif params[:type] == 'administrative_assistant'
      @administrative_assistant = AdministrativeAssistant.create(user: @user)
    end
    redirect_to sign_in_path
    flash[:notice] = 'Solicitação de cadastro efetuado com sucesso!'
  end

  def edit
    @user = User.find(params[:id])
    return unless @user.id != current_user.id
    redirect_to_current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path
      flash[:success] = 'Dados atualizados com sucesso'
    else
      redirect_to user_edit_path
      flash[:warning] = 'Dados não foram atualizados'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.id == current_user.id
      permission_of_destroy
    else
      flash[:error] = 'Acesso Negado'
      redirect_back fallback_location: { action: 'show', id: current_user.id }
    end
  end

  def permission_of_destroy
    if permission[:level] == 2 && AdministrativeAssistant.joins(:user)
                                                         .where(users: { active: true })
                                                         .count == 1
      flash[:error] = 'Não é possível excluir o único assistante Administrativo'
      redirect_to current_user
    else
      @user.update(active: 2)
      flash[:success] = 'Usuário excluído com sucesso'
      redirect_to sign_in_path
    end
  end

  private

  def user_params
    verifyCoordinator
  end

  def redirect_to_current_user
    redirect_back fallback_location: { action: 'show', id: current_user.id }
  end
end
