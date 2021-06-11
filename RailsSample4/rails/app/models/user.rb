class User < ActiveRecord::Base

  def run_thread
    threads = []

    puts "User.count before thread: #{User.count}"

    threads.push(thread_1)
    threads.push(thread_2)
    threads.each { |t| t.value }

    puts "User.count after thread: #{User.count}"
  end

  def thread_1
    Thread.new do
      # if User.count.positive?
      #   puts "User.count in thread_1: #{User.count}"
      #   puts "User.last.inspect in thread_1: #{User.last.inspect}"
      # else
      #   puts 'No user in thread_1'
      # end
      show_user_records('thread_1')
    end
    # Thread.new do
      # ActiveRecord::Base.transaction do
      #   puts 'Thread1 started update record'
      #   puts 'Thread1 finished update record'

      #   puts 'Thread1 started insert record'
      #   for num in 1..2 do
      #     new_user = User.new
      #     new_user.name = 'hoge'
      #     new_user.email = 'hoge@example.com'
      #     new_user.save!
      #     puts 'Thread1 inserted record'
      #   end
      # end
      # puts 'Thread1 commit'
    # end
  end

  def thread_2
    Thread.new do
      show_user_records('thread_2')
      # if User.count.positive?
      #   puts "User.count in thread_2: #{User.count}"
      #   puts "User.last.inspect in thread_2: #{User.last.inspect}"
      # else
      #   puts 'No user in thread_2'
      # end
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
