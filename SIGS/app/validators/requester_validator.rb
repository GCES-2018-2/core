class RequesterValidator < ActiveModel::EachValidator
	
  def validate_each(record, attribute, value)
  	coordinator = Coordinator.find_by(user: value)

    return unless coordinator.course.department != record.school_room.discipline.department
    record.errors.add(:attribute, 'Você não tem permissão para alocar essa turma')
  end
end