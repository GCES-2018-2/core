# frozen_string_literal: true

# Valida a data final de um registro de periodo.
class FinalDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value < record.initial_date
    record.errors.add(:final_date, 'A Data Final deve ser depois da Data de Início')
  end
end
