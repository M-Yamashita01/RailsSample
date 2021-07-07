class User < ActiveRecord::Base

  class_attribute :scopes_, :instance_writer => false
  self.scopes_ = {}

  def self.named_scope(name, options={}, &block)
    scope(name, options, &block)
    self.scopes_[self.to_s] ||= {}
    self.scopes_[self.to_s][name] = Proc.new do |*args|
      cls = args.shift
      if cls.respond_to?(name)
        cls.send(name, *args)
      end
    end
  end

  named_scope :test, (lambda do |*args|
    test_flag = false
    sample = Sample::Hoge.new
    if !sample.is_true?
      test_flag = true
      puts "test_flag is #{test_flag}"
    else
      puts 'test_flag is still false'
    end
  end)

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
