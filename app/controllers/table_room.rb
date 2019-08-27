# frozen_string_literal: true

# module that create rooms' table in pdf
module TableRoom
  def self.generate_room_page_report(pdf, room)
    pdf.text "Sala: #{room.name}", size: 14, style: :bold, align: :center
    data = [[' ', 'Segunda-feira', 'Terça-feira',
             'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado']]
    rw = [0, 2, 4, 6, 8, 10]
    rw.each do |j|
      data << make_rows(room, j)
    end
    pdf.table(data, width: 750) do |t|
      t.before_rendering_page do |page|
        page.row(0).font_style = :bold
      end
    end
  end

  def self.make_rows(room, j)
    @row = [(6 + j).to_s + ':00']
    %w[Segunda Terça Quarta Quinta Sexta Sabado].each do |week|
      allocations = Allocation.where(room_id: room.id).where(day: week)
      @first_time = ((6 + j).to_s + ':00').to_time
      allocations_start = allocations.where(start_time: @first_time)
      make_cell(allocations_start, j, allocations)
    end
    @row
  end

  def self.make_cell(allocations_start, j, allocations)
    if allocations_start.size.zero?
      mount_empty_row(j, allocations)
    else
      mount_full_row(allocations_start)
    end
  end
end

def mount_empty_row(j, allocations)
  @first_time = ((6 + j).to_s + ':00').to_time
  @second_time = ((6 + j).to_s + ':00').to_time
  @row << ' ' if allocations.where(start_time: @first_time)
                            .where(final_time: @second_time)
                            .size.zero?
end

def mount_full_row(allocations_start)
  cell = ''
  allocations_start.each do |allocation|
    cell += allocation.school_room.discipline.name + '    Turma:' +
            allocation.school_room.name
  end
  @row << { content: cell, rowspan: (allocations_start[0].final_time.hour -
                    allocations_start[0].start_time.hour) }
end
