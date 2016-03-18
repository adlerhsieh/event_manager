desc "render bar"
task :foo do
  puts 'bar'
end

desc "add 100 fake events"
namespace :dev do
  task :fake => :environment do
    100.times do |i|
      Event.create( :name => "Event #{i}")
    end
  end
end
