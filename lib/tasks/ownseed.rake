namespace :db do
  task :setTestData, [:times, :dropz] do |t, args|
    args.with_defaults(:times => 10, :dropz => "No")
    puts "Inserting #{args.times} new Courses."
    puts "Drop old courses: #{args.dropz}."
  end
end