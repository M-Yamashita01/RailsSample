require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'テスト' do
    before do
      create(:user)
    end
    it '正常系' do
      puts 'User count in spec'
      puts User.count
      described_class.new.run_thread
    end
  end
end
