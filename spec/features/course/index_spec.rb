require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the courses index page' do
    before :each do
      @student_1 = Student.create!(name: "Harry", age: 15, house: "Gryphindoor")
      @student_2 = Student.create!(name: "Ron", age: 14, house: "Gryphindoor")
      @student_3 = Student.create!(name: "Luna", age: 13, house: "Huffapuff")
      @course_1 = Course.create!(name: "Defense against the Dark Arts")
      @course_2 = Course.create!(name: "Herbology")
      @course_3 = Course.create!(name: "Potions")
      StudentCourse.create!(course_id: @course_1.id, student_id: @student_1.id)
      StudentCourse.create!(course_id: @course_1.id, student_id: @student_2.id)
      StudentCourse.create!(course_id: @course_1.id, student_id: @student_3.id)
      StudentCourse.create!(course_id: @course_2.id, student_id: @student_1.id)
      StudentCourse.create!(course_id: @course_3.id, student_id: @student_3.id)
      visit courses_path
    end
    it 'Shows list of courses and number of enrolled students' do
      expect(page).to have_content("#{@course_1.name}: #{@course_1.students.count}")
    end
    it 'order_students_by_name' do
      expect(@student_1.name).to appear_before(@student_3.name)
      expect(@student_3.name).to appear_before(@student_2.name)
    end
  end
end
