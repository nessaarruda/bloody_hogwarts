require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'class methods' do
    before :each do
    @student_1 = Student.create(name: "Harry", age: 15, house: "Gryphindoor")
    @student_2 = Student.create(name: "Ron", age: 14, house: "Gryphindoor")
    @student_3 = Student.create(name: "Luna", age: 13, house: "Huffapuff")
    end 
    it 'average_age' do

      expect(Student.average_age).to eq(14)
    end

    it 'order_by_name' do
    ordered_students = Student.order_by_name
      expect(ordered_students.first.name).to eq("Harry")
      expect(ordered_students.last.name).to eq("Ron")
    end
  end
end
