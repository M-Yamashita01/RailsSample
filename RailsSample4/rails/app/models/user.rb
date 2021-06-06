class User < ActiveRecord::Base

  def run_thread
    puts 'Records count before thread'
    puts User.count

    threads = []
    threads.push(t2_thread)

    threads.each {|t| t.value}
  end

  def t1_thread
    Thread.new do
      ActiveRecord::Base.transaction do
        puts 'Thread1 started update record'
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
    puts 'User.count before thread'
    puts User.count
    puts 'ActiveRecord::Base.connection.open_transactions'
    puts ActiveRecord::Base.connection.open_transactions
    puts 'ActiveRecord::Base.connection_pool.connections.size'
    puts ActiveRecord::Base.connection_pool.connections.size

    thread = Thread.new do
      puts 'User.count in thread.'
      puts User.count
      puts 'ActiveRecord::Base.connection.open_transactions'
      puts ActiveRecord::Base.connection.open_transactions
      puts 'ActiveRecord::Base.connection_pool.connections.size'
      puts ActiveRecord::Base.connection_pool.connections.size

      ActiveRecord::Base.transaction do
        puts 'User.count in transaction'
        puts User.count
        puts 'ActiveRecord::Base.connection.open_transactions'
        puts ActiveRecord::Base.connection.open_transactions
      end
    end

    thread
  end
end
