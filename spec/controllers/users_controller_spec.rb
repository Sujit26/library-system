require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe 'create' do
      it 'successfully creates a new user' do
        user = User.create(name: "name",email: "email@example.com",is_librarian: true,fine: 0,password: "123qwe")
        expect(User.last.username).to eq("name")
        
      end
    end
  end