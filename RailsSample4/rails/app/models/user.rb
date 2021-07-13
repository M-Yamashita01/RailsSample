class User < ActiveRecord::Base

  def run_thread
    threads = []

    threads.push(thread_1)
    threads.push(thread_2)

    threads.each { |t| t.value }
  end

  def thread_1
    Thread.new do
      ActiveRecord::Base.transaction do
        log('Thread1 started insert record.')
        for num in 1..10 do
          new_user = User.new
          new_user.name = 'hoge'
          new_user.email = 'hoge@example.com'
          new_user.save!
          log('Thread1 inserted record')
        end
        log('Thread1 finished insert record')
      end
    end
  end

  def thread_2
    Thread.new do
      ActiveRecord::Base.transaction do
        log('Thread2 started insert record.')
        for num in 1..10 do
          new_user = User.new
          new_user.name = 'hoge'
          new_user.email = 'hoge@example.com'
          new_user.save!
          log('Thread2 inserted record')
        end
        log('Thread2 finished insert record')
      end
    end
  end

  def show_user_records(thread_name)
    if User.count.positive?
      puts "User.count in #{thread_name}: #{User.count}"
      puts "User.last.inspect in #{thread_name}: #{User.last.inspect}"
    else
      puts "No user in #{thread_name}"
    end
  end

  def log(message)
    puts message
    Rails.logger.info "  #{message}"
  end
end
