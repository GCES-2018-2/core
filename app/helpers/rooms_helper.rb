# frozen_string_literal: true

# rooms module
module RoomsHelper
  def filter_by_department
    return unless params[:department_id].present?
    @rooms = @rooms.where(department_id: params[:department_id])
  end

  def filter_by_capacity
    return unless params[:capacity].present?
    @rooms = @rooms.where('capacity >= ?', params[:capacity])
  end

  def filter_by_buildings
    return unless params[:building_id].present?
    @rooms = @rooms.where(building_id: params[:building_id])
  end

  def filter_by_wings
    return unless params[:wing].present?
    @rooms = @rooms.joins(:building).where(buildings: { wing: params[:wing] })
  end

  def filter_by_name
    return unless params[:name].present?
    @rooms = @rooms.where('rooms.name LIKE ?', "%#{params[:name]}%")
  end

  def filter_by_code
    return unless params[:code].present?
    @rooms = @rooms.where('rooms.code LIKE ?', "%#{params[:code]}%")
  end

  def filter_by_campus
    return unless params[:campus_id].present?
    @rooms = @rooms.where(department: Campus.find_by_id(params[:campus_id]).departments)
  end

  def fetch_filters
    @filter = {
      building_selected: Building.find_by_id(params[:building_id]),
      campus_selected: Campus.find_by_id(params[:campus_id]),
      department_selected: Department.find_by_id(params[:department_id]),
      wing_selected: params[:wing],
      name_selected: params[:name], code_selected: params[:code],
      capacity_selected: params[:capacity]
    }
  end
end
