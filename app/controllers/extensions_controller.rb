# frozen_string_literal: true

# extension controller
class ExtensionsController < ApplicationController
  before_action :logged_in?

  def create
    @extension = Extension.new(allow_extensions_params)
    if @extension.save
      flash[:success] = 'Extensão criada com sucesso'
    else
      flash[:error] = 'Falha ao criar extensão'
    end
    redirect_to allocation_extensions_new_path
  end

  def allow_extensions_params
    params[:extension].permit(:name, :responsible, :vacancies)
  end
end
