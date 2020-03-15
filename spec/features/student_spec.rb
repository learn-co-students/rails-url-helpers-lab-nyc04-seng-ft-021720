require 'byebug'
require 'rails_helper'

describe 'Route to view' do
  it 'has an index page' do
    visit students_path
    expect(page.status_code).to eq(200)
  end
end

describe 'Multiple students' do
  it 'shows them on the index page' do
    Student.create!(first_name: "Daenerys", last_name: "Targaryen")
    Student.create!(first_name: "Lindsey", last_name: "Stirling")

    visit students_path
    expect(page).to have_content(/Daenerys|Lindsey/)
  end
end

describe 'Show page' do
  before do
    @student = Student.create!(first_name: "Daenerys", last_name: "Targaryen")
  end

  it 'renders properly' do
    visit student_path(@student)
    expect(page.status_code).to eq(200)
  end

  it 'renders the first name in a h1 tag' do
    visit student_path(@student)
    expect(page).to have_css("h1", text: "Daenerys")
  end

  it 'renders the last name in a h1 tag' do
    visit student_path(@student)
    expect(page).to have_css("h1", text: "Targaryen")
  end


end

describe 'Activate page' do
  before do
    @student = Student.create!(first_name: "Daenerys", last_name: "Targaryen")
  end

  

  it "Should redirect to the student show page" do
    visit activate_student_path(@student)
    expect(page.current_path).to eq(student_path(@student))
  end
end

describe 'linking from the index page to the show page' do
  it 'index page links to post page' do
    @student = Student.create!(first_name: "Daenerys", last_name: "Targaryen")
    visit students_path
    expect(page).to have_link(@student.to_s, href: student_path(@student))
  end
end
