require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#run_thread' do
    before do
      create_list(:user, 10)
    end

    it 'レコード確認' do
      described_class.new.run_thread
    end

    def log(message)
      puts message
      Rails.logger.info "  #{message}"
    end
  end
end
