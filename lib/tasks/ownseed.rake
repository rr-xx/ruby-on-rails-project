namespace :db do
  task :setTestData, [:times, :dropz]  => [:environment] do |t, args|
    args.with_defaults(:times => 10, :dropz => "No")
    puts "Inserting #{args.times} new Courses."
    puts "Drop old courses: #{args.dropz}."
    
    if args.dropz == "yes"
      Course.delete_all()
    end
    require 'populator'
    require 'faker'
    args.times.to_i.times do
      name = Populator.words(1..2).titleize
      description = Populator.words(100..500)
      Course.create( :name => name, :description => description)
    end
  end
end