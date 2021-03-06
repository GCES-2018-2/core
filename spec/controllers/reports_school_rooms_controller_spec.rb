require 'rails_helper'
include SessionsHelper

RSpec.describe ReportsSchoolRoomsController, type: :controller do
  describe 'report school room controller methods' do
    before(:each) do
      @user = User.create(name: 'joao silva', email: 'joaosilva@unb.br', password: '123456', registration:'1100061', cpf:'05601407380', active: true)
      @campus = Campus.create(name: 'Gama')
      @department = Department.create(name: 'Departamento de Matemática', code: '007', campus_id: @campus.id)
      @course = Course.create(name:'Matemática', code: '009', department: @department)
      @coordinator = Coordinator.create(user: @user, course: @course)

      @period_1 = Period.create(period_type:'Alocação', initial_date: '10-01-2018', final_date: '01-02-2018')
      @period_2 = Period.create(period_type:'Ajuste', initial_date: '23-02-2018', final_date: '01-03-2018')
      @period_3 = Period.create(period_type:'Letivo', initial_date: '08-03-2018', final_date: '14-07-2018')
      @building = Building.create(code: 'ICC', name: 'ICC')
      @discipline = Discipline.create(name: 'Análise Combinatória', code: '123', department: @department)
      @discipline2 = Discipline.create(name: 'Geografia', code: '321', department: @department)
      @disciplin3 = Discipline.create(name: 'Teologia', code: '666', department: @department)

      @school_room = SchoolRoom.create(name:"YY", vacancies: 50, discipline: @discipline, course_ids: [@course.id], coordinator_id: @coordinator.id)
      @school_room_2 = SchoolRoom.create(name:"XY", vacancies: 50, discipline: @discipline, course_ids: [@course.id], coordinator_id: @coordinator.id)

      @room = Room.create(code: 'S10', name: 'Superior 10', capacity: 50, computers: 50, active: true, time_grid_id: 1, building: @building, details: "Nada informado", department: @department )
      @room_2 = Room.create(code: 'S11', name: 'Superior 10', capacity: 50, computers: 50,  active: true, time_grid_id: 1, building: @building, details: "Nada informado", department: @department )

      @allocation = Allocation.create(active: true, start_time: '14:00', final_time: '16:00', day: 'Segunda',user: @user, room: @room, school_room: @school_room)
      @allocation2 = Allocation.create(active: true, start_time: '14:00', final_time: '16:00', day: 'Terça',user: @user, room: @room2, school_room: @school_room)

      sign_in(@user)
    end

    it "should return allocated school rooms" do
      get :allocated_school_rooms_report
      allocations = assigns(:allocations)
      expect(allocations.count).to eq(Allocation.count)
    end

    it "should return unallocated school rooms" do
      get :unallocated_school_rooms_report
      unallocated_school_rooms = assigns(:unallocated_school_rooms)
      expect(unallocated_school_rooms).to include(@school_room_2)
    end

    it "should return all school rooms" do
      get :all_school_rooms_report
      allocations = assigns(:allocations)
      expect(allocations).to include(@allocation)
    end
  end
end
