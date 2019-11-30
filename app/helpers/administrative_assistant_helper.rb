# frozen_string_literal: true

# administrative assistant module
module AdministrativeAssistantHelper
  def user_by_id
    User.find(params[:id])
  end
end
