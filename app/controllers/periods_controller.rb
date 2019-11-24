# frozen_string_literal: true

# class with period's actions
class PeriodsController < ApplicationController
  before_action :logged_in?
  before_action :authenticate_administrative_assistant?

  def index
    @periods = Period.all
  end

  def edit
    @period = Period.find(params[:id])
  end

  def update
    @period = Period.find(params[:period][:id])
    if @period.update_attributes(return_period_params)
      success_message = 'Dados do período atualizados com sucesso'
      redirect_to period_index_path, flash: { success: success_message }
    else
      flash[:error] = 'Dados do período não foram atualizados'
      render :edit
    end
  end

  private

  def return_period_params
    params[:period].permit(:id, :period_type, :initial_date, :final_date)
  end
end
