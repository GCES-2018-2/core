# frozen_string_literal: true

# Valida cursos
class CoursesValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.size.zero?

    response = value[0].shift
    value.each do |course_of_school_room|
      if course_of_school_room.shift != response
        record.errors.add(attribute, 'Cursos devem ser do mesmo período')
        break
      end
    end
  end
end
