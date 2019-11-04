# frozen_string_literal: true

require 'prawn/table'
require 'prawn'

# class responsible to generate report
class ReportsController < ApplicationController
  before_action :logged_in?
  Prawn::Font::AFM.hide_m17n_warning = true

  def by_room
    @departments = Department.all
    @rooms = get_rooms_by_department( @departments[0])
  end

  def by_building
    @buildings = if params[:search]
                   Building.search(params[:search])
                 else
                   Building.all
                   Building.order('name')
                 end
  end

  def generate_by_building
    building = Building.find(params[:id])
    rooms = Room.where('building' => building.id)
    if !rooms.count.zero?
      report = Prawn::Document.new(page_size: 'A4', page_layout: :landscape) do |pdf|
        rooms.each do |room|
          pdf.text 'Relatório de Alocação por Prédio', size: 14, align: :center
          pdf.move_down 7
          pdf.text building.name.to_s, size: 14, align: :center
          pdf.move_down 7
          TableRoom.generate_room_page_report(pdf, room)
        end
      end
      send_data report.render, type: 'application/pdf', disposition: 'inline'
    else
      flash_message_building
    end
  end

  def generate_by_room
    report = Prawn::Document.new(page_size: 'A4', page_layout: :landscape) do |pdf|
      if params[:reports_by_room][:all_rooms] == '0'
        room_selected = Room.find(params[:reports_by_room][:room_code])
        TableRoom.generate_room_page_report(pdf, room_selected)
      else
        generate_by_all_rooms(pdf)
      end
    end
    send_data report.render, type: 'application/pdf', disposition: 'inline'
  end

  def generate_by_all_rooms(pdf)
    new_page = false
    rooms = get_rooms_by_department(department)
    rooms.each do |room|
      pdf.start_new_page if new_page
      TableRoom.generate_room_page_report(pdf, room)
      new_page = true
    end
  end

  def json_of_rooms_by_department
	department = Department.find_by(code: params[:department_code])
    rooms = get_rooms_by_department(department)
    render inline: obtain_room_list_with_name_id(rooms).to_json
  end

  def json_of_rooms_with_parts_of_name
    department = Department.find_by(code: params[:department_code])
    rooms = get_rooms_by_department(department)
    part_name = params[:part_name]
    rooms = rooms.where('name LIKE ?', "%#{part_name}%").select('id, name')
    render inline: obtain_room_list_with_name_id(rooms).to_json
  end

  private

  def obtain_room_list_with_name_id(rooms)
    rooms.map do |u|
      {
        id: u.id, name: u.name
      }
    end
  end

  def flash_message_building
    flash[:error] = 'Este prédio não possui salas'
    by_building
    render :by_building
  end
end
