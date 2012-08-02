# Test script to test that only 2 critical threads can be running at the same time.
# Threads 
require 'thread'
require '../lib/semaphore.rb'

mutex = Mutex.new

s = Semaphore.new(2)
count = 0
6.times do |x|
  t = Thread.new do
    s.synchronize do
      mutex.synchronize do
        count += 1
        puts "Thread #{x} incremented count to #{count}\n"
      end
      sleep 1
      mutex.synchronize do
          count -= 1
          puts "Thread #{x} decremented count to #{count}\n"
        end
    end
    puts "Thread #{x} ended\n"
    #sleep 5
  end

end

sleep 10