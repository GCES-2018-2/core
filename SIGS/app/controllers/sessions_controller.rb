# frozen_string_literal: true

# class that controller the actions of a user
class SessionsController < ApplicationController
  def login
    if current_user.present?
      redirect_to current_user, notice: 'Você já está logado'
    else
      puts MatriculaWeb::Seeder.courses()
      render 'login'
    end
  end

  def create_login
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      active(@user)
    else
      flash[:error] = 'Email ou senha incorretos'
      render 'login'
    end
  end

  def destroy
    sign_out
    redirect_to root_url, notice: 'Usuário deslogado com sucesso'
  end

  def active(user)
    if user.active == 1
      sign_in(user)
      redirect_to current_user, notice: 'Login realizado com sucesso'
    else
      flash[:error] = 'Sua conta não está ativa'
      render 'login'
    end
  end

  def join
    @user = User.new
    @user.build_deg
    @user.build_coordinator
    @user.build_administrative_assistant
  end

  def create_join
    @user = User.new(user_params)
    if @user.save
      if params[:type] == 'deg'
        @deg = Deg.create(user: @user)
      elsif params[:type] == 'administrative_assistant'
        @administrative_assistant = AdministrativeAssistant.create(user: @user)
      end
      redirect_to login_path
      flash[:notice] = 'Solicitação de cadastro efetuado com sucesso!'
    else
      @user.build_deg
      @user.build_coordinator
      @user.build_administrative_assistant
      render :join
    end
  end

  private

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
end
