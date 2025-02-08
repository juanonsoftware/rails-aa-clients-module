require 'rails_helper'

RSpec.describe ModuleClients::Client, type: :model do
  describe 'Associations' do
    it { should have_many(:domains) }
    it { should belong_to(:admin_user) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }

    context 'general' do
      let(:admin_user) { AdminUser.new(email: 'admin@example.com') }

      it 'should be valid if all attributes are valid' do
        entity =  ModuleClients::Client.new(name: 'Test', admin_user: admin_user)
        expect(entity).to be_valid
      end

      it 'should be invalid if missing admin user' do
        entity =  ModuleClients::Client.new(name: 'Test')
        expect(entity).to_not be_valid
        expect(entity.errors.messages[:admin_user]).to include('must exist')
      end
    end

    context 'name must be uniq' do
      let(:admin_user) { AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') }
      
      it 'should be invalid if name is not unique' do
        ModuleClients::Client.create!(name: 'Test', admin_user: admin_user)

        entity =  ModuleClients::Client.new(name: 'Test', admin_user: admin_user)
        
        expect(entity).to_not be_valid
        expect(entity.errors.messages[:name]).to include('has already been taken')
      end

      it 'should be invalid if user is already used' do
        ModuleClients::Client.create!(name: 'Test', admin_user: admin_user)

        entity =  ModuleClients::Client.new(name: 'Test 2', admin_user: admin_user)
        
        expect(entity).to_not be_valid
        expect(entity.errors.messages[:admin_user]).to include('has already been taken')
      end
    end
  end
end