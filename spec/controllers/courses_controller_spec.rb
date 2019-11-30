require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  describe "GET #courses_by_coordinator" do
    it "returns http success" do
      get :courses_by_coordinator
      expect(response).to have_http_status(:success)
    end
  end

end
