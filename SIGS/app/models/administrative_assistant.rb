# frozen_string_literal: true

# administrative assistant class
class AdministrativeAssistant < ApplicationRecord
  belongs_to :user, optional: true

  def self.only_one?
    joins(:user).where(users: { active: true }).count == 1
  end
end
