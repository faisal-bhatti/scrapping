# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

courses = [{course_name: "Play Group", value:"pg"},{course_name: "KG-1", value: "kg1"},{course_name: "KG-2", value: "kg2"},{course_name: "One", value: "1"},{course_name: "Two", value: "2"},{course_name: "Three", value: "3"},{course_name: "Four", value: "4"},{course_name: "Five", value: "5"},{course_name: "Six", value: "6"},{course_name: "Seven", value: "7"},{course_name: "Eight", value: "8"},{course_name: "Nine", value: "9"},{course_name: "Matric", value: "10"},{course_name: "1st Year", value: "11"},{course_name: "2nd Year", value: "12"}]
courses.each do |course|
    Course.create!(course_name: course[:course_name], code: course[:value])
end

subject_array = [{name: 'English', value: 'english'}, {name: 'Urdu', value: 'urdu'},{name: 'Math',value: 'math'},{name: 'Science',value: 'science'},{name: 'Pak-Study',value: 'pak-study'},{name: 'General Knowledge',value: 'general knowledge'},{name: 'Islamiyat',value: 'islamiyat'},{name: 'Drawing',value: 'drawing'},{name: 'Home Economics',value: 'home economics'},{name: 'Physics',value: 'physics'},{name: 'Chemistry',value: 'chemistry'},{name: 'Biology',value: 'biology'},{name: 'Compputre',value: 'computer'},{name: 'Islamiyat Ellective',value: 'islamiyat elective'},{name: 'Punjabi',value: 'punjabi'}]
subject_array.each do |s|
    DefaultSubject.create!(name: s[:name], code: s[:value])
end


User.create!({:username=>"admin",:email=>"admin@academia.com",:password=>"admin123",:password_confirmation=>"admin123",:user_type=>"admin"})
User.create!({:username=>"faisal",:email=>"faisal@academia.com",:password=>"admin123",:password_confirmation=>"admin123",:user_type=>"user"})

