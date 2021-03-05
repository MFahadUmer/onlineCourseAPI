require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:user) do
    User.create(id: 1, first_name: 'Muhammad', last_name: 'Fahad Umer', username: 'user', user_type: 'user',
                email: 'eng.fahadumer1@gmail.com', password: 'asdfgh')
  end
  let(:user2) do
    User.create(id: 2,
                first_name: 'Muhammad', last_name: 'Farooq Ahmed', username: 'author', user_type: 'author',
                email: 'eng.fahadumer2@gmail.com', password: 'asdfgh')
  end
  let(:course) do
    user2.courses.build(id: 1,
                        course_title: 'React and Redux', course_details: 'Its a very nice course',
                        course_image: 'https://www.wrappixel.com/wp-content/uploads/2019/08/guide-for-react-redux.jpg',
                        course_price: '100', course_requirements: 'No Requirements', course_difficulty: 'Beginners')
  end
  let(:favourite) { user.favourites.build(id: 1, course_id: 1) }
  it('should be invalid if user is not login') do
    course.course_author = 4
    expect(course).not_to be_valid
  end

  it('should be valid if user is not login') do
    user2
    expect(course).to be_valid
  end

  it('should be valid if every filed is not empty') do
    user2
    expect(course).to be_valid
  end

  it('should not be valid if any filed is empty') do
    course.course_title = ''
    expect(course).not_to be_valid
  end

  it('should be valid if association between course and user is present') do
    user2
    expect(course.user.first_name).to eq('Muhammad')
  end
end
