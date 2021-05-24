class User < ActiveRecord::Base

  @@thread_1_updated = false
  @@thread_2_updated = false

  def run_thread
    threads = []
    threads.push(t1_thread)
    threads.push(t2_thread)

    threads.each {|t| t.value}
  end

  def t1_thread
    Thread.new do
      ActiveRecord::Base.transaction do
        puts 'Thread1 started update record'
        # User.where(id: 0).update_all(name: 'baz')
        puts 'Thread1 finished update record'

        puts 'Thread1 started insert record'
        for num in 1..2 do
          new_user = User.new
          new_user.name = 'hoge'
          new_user.email = 'hoge@example.com'
          new_user.save!
          puts 'Thread1 inserted record'
        end
      end
      puts 'Thread1 commit'
    end
  end

  def t2_thread
    Thread.new do
      ActiveRecord::Base.transaction do
        puts 'Thread2 started update record'
        User.where(id: 1).update_all(name: 'test')
        puts 'Thread2 finished update record'

        puts 'Thread2 started insert record'
        for num in 1..2 do
          new_user = User.new
          new_user.name = 'sample'
          new_user.email = 'sample@example.com'
          new_user.save!
          puts 'Thread2 inserted record'
        end
      end
      puts 'Thread2 commit'
    end
  end
end
