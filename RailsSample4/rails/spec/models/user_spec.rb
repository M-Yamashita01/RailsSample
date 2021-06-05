require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'テスト' do
    # let(:user) { create(:user) }
    before do
      # create_list(:user, 10)
      create(:user)

      # User.create_list(name: 'foo', email: 'foo@example.com', )
      # User.create(name: 'bar', email: 'bar@example.com')
    end
    it '正常系' do
      puts 'User count in spec'
      puts User.count
      described_class.new.run_thread
    end
  end
end
