class User < ApplicationRecord

  def run_thread
    threads = []
    threads.push(t1_thread(1))
    # threads.push(t1_thread(2))
    # threads.push(t2_thread)

    threads.each {|t| t.value}
  end

  def t1_thread(thread_number)
    Thread.new do
      # binding.pry
      # ActiveRecord::Base.transaction do
      #   log("Thread#{thread_number} started insert record")
      #   for num in 1..10 do
      #     new_user = User.new
      #     new_user.name = 'hoge'
      #     new_user.email = 'hoge@example.com'
      #     new_user.save!
      #     log("Thread#{thread_number} inserted record")
      #   end
      #   log("Thread#{thread_number} finished insert record")
      # end
      User.find(1)
      User.find_by(email: 'MyString')
      User.first
      User.last
      
      User.where(id: 1)
    end
  end

  def t2_thread
    Thread.new do
      ActiveRecord::Base.transaction do
        log('Thread2 started insert record')
        for num in 1..10 do
          new_user = User.new
          new_user.name = 'sample'
          new_user.email = 'sample@example.com'
          new_user.save!
          log('Thread2 inserted record')
        end
        log('Thread2 finished insert record')
      end
    end
  end

  def log(message)
    puts message
    Rails.logger.info "  #{message}"
  end
end
