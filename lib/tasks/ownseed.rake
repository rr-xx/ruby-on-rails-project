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
      description = Populator.words(100..500)
      c = Course.create!( :name => name, :description => description)
      5.times do
        ci = CourseInstance.create!
        ci.lecture_time = Populator.words(1).titleize
        c.course_instances << ci
        5.times do
          ci.exercise_groups << ExerciseGroup.create!
        end
      end
      c.save
    end
  end
end