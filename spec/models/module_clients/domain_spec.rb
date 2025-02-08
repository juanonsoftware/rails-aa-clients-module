require 'rails_helper'

RSpec.describe ModuleClients::Domain, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    # it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_length_of(:name).is_at_most(255) }
  end

  describe 'Associations' do
    it { should belong_to(:client) }
  end
end