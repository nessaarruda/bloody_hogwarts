require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a student page' do
    before :each do
      @student_1 = Student.create!(name: "Harry", age: 15, house: "Gryphindoor")
      @student_2 = Student.create!(name: "Ron", age: 14, house: "Gryphindoor")
      @student_3 = Student.create!(name: "Luna", age: 13, house: "Huffapuff")
      @course_1 = Course.create!(name: "Defense against the Dark Arts")
      @course_2 = Course.create!(name: "Herbology")
      @course_3 = Course.create!(name: "Potions")
      StudentCourse.create!(course_id: @course_1.id, student_id: @student_1.id)
      StudentCourse.create!(course_id: @course_2.id, student_id: @student_2.id)
      StudentCourse.create!(course_id: @course_3.id, student_id: @student_3.id)
    end
    it 'I see a list of the students courses' do
      visit "/students/#{@student_1.id}"

      expect(page).to have_content("#{@student_1.courses.first.name}")
      expect(page).to_not have_content("#{@student_3.courses.first.name}")
    end
  end
end
