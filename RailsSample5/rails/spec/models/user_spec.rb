require 'rails_helper'

# RSpec.describe User, type: :model do
RSpec.describe User, 'RSpec test' do
  describe 'テスト' do
    before do
      create_list(:user, 10)
      # User.create_list(name: 'foo', email: 'foo@example.com', )
      # User.create(name: 'bar', email: 'bar@example.com')
    end
    it '正常系' do
      
      described_class.new.run_thread
    end
  end
end