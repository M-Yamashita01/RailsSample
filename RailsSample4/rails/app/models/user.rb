class User < ActiveRecord::Base

  def sample_method
    sample_hoge = Sample::Hoge.new

    # outer comment
    do_a

    if !condition
      # comment
      do_a
    else
      do_c
    end
  end

  def run_thread
    threads = []

    puts "User.count before thread: #{User.count}"

    threads.push(thread1)
    threads.push(thread2)
    threads.each { |t| t.value }

    threads.each { |t| t.value }
  end

  def is_true?
    true
  end

  def thread1
    Thread.new do
<<<<<<< HEAD
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
=======
      show_user_records('thread_1')
>>>>>>> ee265284b2e273c53d41c1c9d54914933529e813
    end
  end

  def thread2
    Thread.new do
<<<<<<< HEAD
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
=======
      show_user_records('thread_2')
>>>>>>> ee265284b2e273c53d41c1c9d54914933529e813
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
