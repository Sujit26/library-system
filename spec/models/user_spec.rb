require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    it 'can be created' do
      user = User.create(name: "name",email: "email@example.com",is_librarian: true,fine: 0,password: "123qwe")
      expect(User.last.username).to eq("name")
      
    end
  end
end