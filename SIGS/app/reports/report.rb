# frozen_string_literal: true

require 'prawn/table'
require 'prawn'

# Cria um documento de relatorio
class Report
  def initialize
    @document = Prawn::Document.new(page_size: 'A4', page_layout: :landscape)
  end

  def format(formatter: SinglePage.new)
    formatter.new.format(@document)
  end
end

# Classe base para formatacao de um relatorio.
class BaseFormatter
  def initialize(data)
    @data = data
  end
end

# Classe para formatacao de relatorios de 1 pagina.
class SinglePage < BaseFormatter
  def format(document)
    document do |pdf|
      TableRoom.generate_room_page_report(pdf, @data)
    end
  end
end

# Classe para formatacao de relatorios de multiplas paginas.
class MultiplePages < BaseFormatter
  def format(document)
    document do |pdf|
      new_page = false
      @data.each do |room|
        pdf.start_new_page if new_page
        TableRoom.generate_room_page_report(pdf, room)
        new_page = true
      end
    end
  end
end
