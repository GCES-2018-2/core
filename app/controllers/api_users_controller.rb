# frozen_string_literal: true

# api users controller
class ApiUsersController < ApplicationController
  before_action :logged_in?

  def index
    @api_users = ApiUser.where(user_id: current_user.id)
  end

  def new
    @api_user = ApiUser.new
  end

  def create
    @api_user = ApiUser.new(obtain_user_from_api)
    @api_user.user_id = current_user.id
    @api_user = create_token_params(obtain_user_from_api, @api_user)
    if @api_user.save
      ApiUserMailer.create_email(@api_user, current_user).deliver_now
      flash[:success] = 'Usuário de API salvo'
      redirect_to api_users_show_path(@api_user.id)
    else
      flash[:error] = 'Usuário de API não foi salvo'
      render :new
    end
  end

  def edit
    find_api_user
  end

  def update
    @api_user = ApiUser.find(params[:id])
    @api_user = create_token_params(obtain_user_from_api, @api_user)
    if @api_user.update_attributes(name: obtain_user_from_api[:name],
                                   email: obtain_user_from_api[:email],
                                   secret: @api_user.secret,
                                   token: @api_user.token)
      redirect_to api_users_show_path(@api_user.id), flash:
      { success: 'Usuário de API atualizado com sucesso' }
    else
      flash[:error] = 'Usuário de API não pode ser atualizado'
      render :edit
    end
  end

  def show
    find_api_user
  end

  def destroy
    @api_user = ApiUser.find(params[:id])
    if @api_user.user_id == current_user.id && @api_user.destroy
      redirect_to api_users_index_path, flash:
      { success: 'Usuário de API excluido com sucesso' }
    else
      redirect_to api_users_index_path, flash:
      { error: 'Usuário de API não pode ser excluido' }
    end
  end

  private

  def find_api_user
    @api_user = ApiUser.find(params[:id])
  end

  def obtain_user_from_api
    params[:api_user].permit(:name, :email)
  end

  def create_token_params(obtain_user_from_api, api_user)
    random_string = (0..7).map { ('a'..'z').to_a[rand(26)] }.join
    api_user.secret = BCrypt::Password.create(random_string)
    payload = { name: obtain_user_from_api[:name], email: obtain_user_from_api[:email] }
    api_user.token = JWT.encode payload, api_user.secret, 'HS256'
    api_user
  end
end
