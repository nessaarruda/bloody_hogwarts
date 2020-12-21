require 'rails_helper'

  describe 'As a visitor' do
    describe 'When I visit the index page' do
      before :each do
        @student_1 = Student.create(name: "Harry", age: 15, house: "Gryphindoor")
        @student_2 = Student.create(name: "Ron", age: 14, house: "Gryphindoor")
        @student_3 = Student.create(name: "Luna", age: 13, house: "Huffapuff")
      end
      it 'Shows all students and its attributes' do
        visit students_path

        expect(page).to have_content("#{@student_1.name}")
        expect(page).to have_content("#{@student_1.age}")
        expect(page).to have_content("#{@student_1.house}")
        expect(page).to have_content("#{@student_2.name}")
        expect(page).to have_content("#{@student_2.age}")
        expect(page).to have_content("#{@student_2.house}")
        expect(page).to have_content("#{@student_3.name}")
        expect(page).to have_content("#{@student_3.age}")
        expect(page).to have_content("#{@student_3.house}")
      end
      it 'Shows students average age' do
        visit students_path

        expect(page).to have_content(14)
      end
    end
  end
