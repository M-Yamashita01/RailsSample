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

    puts "User.count after thread: #{User.count}"
  end

  def is_true?
    true
  end

  def thread1
    Thread.new do
      show_user_records('thread_1')
    end
  end

  def thread2
    Thread.new do
      show_user_records('thread_2')
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
