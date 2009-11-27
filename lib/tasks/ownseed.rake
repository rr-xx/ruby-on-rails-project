namespace :db do
  task :setTestData, [:times, :dropz]  => [:environment] do |t, args|
    args.with_defaults(:times => 10, :dropz => "No")
    puts "Inserting #{args.times} new Courses."
    puts "Drop old courses: #{args.dropz}."
    
    if args.dropz == "yes"
      Course.destroy_all()
    end
    require 'populator'
    require 'faker'
    args.times.to_i.times do
      name = Populator.words(3..4).titleize
      description = Populator.words(100..200)
      c = Course.create!( :name => name, :description => description)
      for j in 1..3 do
        ci = CourseInstance.create!
        ci.lecture_time = Date::MONTHNAMES[j].to_s + " "+ (2011-j).to_s
        c.course_instances << ci
        for i in 0..6 do
          ci.exercise_groups << ExerciseGroup.create!( :number => i, :lecture_time =>  Date::DAYNAMES[i] )
        end
      end
      c.save
    end
  end
end