#
# semaphore.rb
# Counting semaphore implementation for Ruby 1.9.3
# Version: 0.0.1
# Author: Luis Doubrava, Rob van Aarle
# Based on semaphore.rb,v 1.2 2003/03/15 20:10:10 fukumoto Exp
#

class CountingSemaphore
  def initialize(initvalue = 0)
    @counter = initvalue
    @waiting_thread = nil
    @counter_mutex = Mutex.new
    @queue_mutex = Mutex.new
  end

  def wait
    @queue_mutex.synchronize do
      stop_thread = false
      @counter_mutex.synchronize do
        if (@counter -= 1) < 0
          @waiting_thread = Thread.current
          stop_thread = true
        end
        self
      end
      Thread.stop if stop_thread
    end
  end

  def signal
    @counter_mutex.synchronize do
      begin
        if (@counter += 1) <= 0
          if @waiting_thread
            @waiting_thread.wakeup
            @waiting_thread = nil
          end
        end
      rescue ThreadError
        retry
      end
      self
    end
  end

  alias down wait
  alias up signal
  alias P wait
  alias V signal

  def exclusive
    wait
    yield
  ensure
    signal
  end

  alias synchronize exclusive

end

Semaphore = CountingSemaphore