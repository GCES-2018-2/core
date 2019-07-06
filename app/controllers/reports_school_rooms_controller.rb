# frozen_string_literal: true

# class responsible to generate report by school rooms
class ReportsSchoolRoomsController < ApplicationController
  def school_reports; end

  def unallocated_school_rooms_report
    allocated_school_rooms = Allocation.ids

    @unallocated_school_rooms = SchoolRoom.where(
      'id NOT IN (?)', allocated_school_rooms
    )
  end

  def all_school_rooms_report
    allocated_school_rooms_report
    unallocated_school_rooms_report
  end

  def allocated_school_rooms_report
    @allocations = Allocation.all
  end
end
