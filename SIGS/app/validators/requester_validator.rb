# frozen_string_literal: true

# valida permissao do usuario que solicita alocacao
class RequesterValidator < ActiveModel::EachValidator
  def validate_each(record, _attribute, value)
    coordinator = Coordinator.find_by(user: value)
    value_school_room = record.school_room.discipline.department
    return unless coordinator.course.department != value_school_room
    record.errors.add(:_attribute, 'Você não tem permissão para alocar essa turma')
  end
end
