require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "Test methods of Controller Sessions" do

    before(:each) do
      @user = User.create(name: 'teste123', cpf: '05365052170', registration: '1234567' , email: 'test@unb.br', password: '123123', active: true)
      @user1 = User.create(name: 'teste1234', cpf: '05365052171', registration: '1234568', email: 'test1@unb.br', password: '1231234', active: false)
    end

    it "Testing session instance" do
      get :login
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "Should create a session with corrects arguments" do
      post :create_login ,params: {session: {email: 'test@unb.br',password: '123123'}}
      expect(session[:user_id]).to eq(@user.id)
      expect(flash[:notice]).to eq('Login realizado com sucesso')
    end

    it "Should not create a session with wrong arguments(password) " do
      post :create_login ,params: {session: {email: 'test@test.com',password: '1231234'}}
      expect(flash.now[:error]).to eq('Email ou senha incorretos')
    end

    it "Should not create a session with wrong arguments(email) " do
      post :create_login ,params: {session: {email: 'test123@unb.br',password: '123123'}}
      expect(flash.now[:error]).to eq('Email ou senha incorretos')
    end

    it "Should not create a session if user isn't active" do
      post :create_login ,params: {session: {email: 'test1@unb.br',password: '1231234'}}
      expect(flash.now[:error]).to eq('Sua conta não está ativa')
    end

    it "Should destroy a session and redirect to root_url" do
      post :create_login ,params: {session: {email: 'test@unb.br',password: '123123'}}
      delete :destroy
      expect(session[:user_id]).to eq(nil)
      expect(@current_user).to eq(nil)
      expect(response).to redirect_to(root_url)
    end
    it "Should not create a session if user is logged in" do
      post :create_login ,params: {session: {email: 'test@unb.br',password: '123123'}}
      get :login
      expect(flash.now[:notice]).to eq('Você já está logado')
    end

  end

  describe 'User new and create methods' do

    it 'should return new view' do
      get :join
      expect(response).to have_http_status(200)
    end

    it 'should create a new user' do
      post :create_join, params:{user: {name: 'joao silva', email: 'joaosilva@unb.br',
        password: '123456', registration:'1100061', cpf:'05601407380', active: 0}}
      expect(flash[:notice]).to eq('Solicitação de cadastro efetuado com sucesso!')
      expect(User.count).to be(1)
    end

    it 'should not create a new user (wrong name)' do
      post :create_join, params:{user: {name: 'joao', email: 'joaosilva@unb.br',
        password: '123456', registration:'1100061', cpf:'05601407380', active: 0}}
      expect(User.count).to be(0)
    end

    it 'should not create a new user (invalid unb email)' do
      post :create_join, params:{user: {name: 'joao silva', email: 'joaosilva@gmail.com',
        password: '123456', registration:'1100061', cpf:'05601407380', active: 0}}
      expect(User.count).to be(0)
    end

    it 'should not create a new user (short password)' do
      post :create_join, params:{user: {name: 'joao silva', email: 'joaosilva@unb.br',
        password: '12345', registration:'1100061', cpf:'05601407380', active: 0}}
      expect(User.count).to be(0)
    end

    it 'should not create a new user (invalid registration)' do
      post :create_join, params:{user: {name: 'joao silva', email: 'joaosilva@unb.br',
        password: '123456', registration:'110006100', cpf:'05601407380', active: 0}}
      expect(User.count).to be(0)
    end

    it 'should not create a new user (invalid cpf)' do
      post :create_join, params:{user: {name: 'joao silva', email: 'joaosilva@unb.br',
        password: '123456', registration:'1100061', cpf:'0560140738000', active: 0}}
      expect(User.count).to be(0)
    end

    it 'should create a new coordinator user' do
      @department = Department.create(name: 'Departamento de Computação')
      @course = Course.create(name: 'Engenharia de Software', department: @department)
      post :create_join, params:{user: {name: 'joao silva', email: 'joaosilva@unb.br',
        password: '123456', registration:'1100061', cpf:'01505038137', active: 0, coordinator_attributes: {course_id: @course.id}}, type: 'coordinator'}
      expect(User.count).to be(1)
      expect(Coordinator.count).to be(1)
    end

    it 'should create a new administrarive assistant user' do
      post :create_join, params:{user: {name: 'joao silva', email: 'joaosilva@unb.br',
        password: '123456', registration:'1100061', cpf:'01505038137', active: 0}, type: 'administrative_assistant'}
      expect(User.count).to be(1)
      expect(AdministrativeAssistant.count).to be(1)
    end

    it 'should create a new deg user' do
      post :create_join, params:{user: {name: 'joao silva', email: 'joaosilva@unb.br',
        password: '123456', registration:'1100061', cpf:'01505038137', active: 0}, type: 'deg'}
      expect(User.count).to be(1)
      expect(Deg.count).to be(1)
    end
  end
end
