require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses) }
  end

  describe 'instance methods' do
    it 'count_students' do
      @student_1 = Student.create!(name: "Harry", age: 15, house: "Gryphindoor")
      @student_2 = Student.create!(name: "Ron", age: 14, house: "Gryphindoor")
      @student_3 = Student.create!(name: "Luna", age: 13, house: "Huffapuff")
      @course_1 = Course.create!(name: "Defense against the Dark Arts")
      @course_2 = Course.create!(name: "Herbology")
      @course_3 = Course.create!(name: "Potions")
      StudentCourse.create!(course_id: @course_1.id, student_id: @student_1.id)
      StudentCourse.create!(course_id: @course_1.id, student_id: @student_2.id)
      StudentCourse.create!(course_id: @course_2.id, student_id: @student_1.id)
      StudentCourse.create!(course_id: @course_3.id, student_id: @student_3.id)
      expect(@course_1.count_students).to eq(2)
      expect(@course_2.count_students).to eq(1)
      expect(@course_3.count_students).to eq(1)
    end
    describe 'class methods' do
      it 'order_by_name' do
      @course_1 = Course.create!(name: "Defense against the Dark Arts")
      @course_2 = Course.create!(name: "Herbology")
      @course_3 = Course.create!(name: "Potions")
      ordered_courses = Course.order_by_name
        expect(ordered_courses.first.name).to eq("Defense against the Dark Arts")
        expect(ordered_courses.last.name).to eq("Potions")
      end
    end
  end
end
