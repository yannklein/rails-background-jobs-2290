class FakeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    now = Time.now
    puts "#{now} I'm starting the fake job"
    sleep 3
    puts "#{now} Ok I'm done now!"
  end
end
