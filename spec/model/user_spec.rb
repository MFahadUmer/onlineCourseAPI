require 'rails_helper'

RSpec.describe User, type: :model do
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
  it 'should be invalid if firstname is less than 4 characters' do
    user.first_name = '123'
    expect(user).to_not be_valid
  end

  it 'should be valid if username is greater than 4 characters' do
    user.username = 'nam22' * 2
    expect(user).to be_valid
  end

  it 'should be invalid if username is empty' do
    user.username = ''
    expect(user).to_not be_valid
  end

  it 'should be valid if association between user and Courses works' do
    user2
    course
    expect(user2.courses.first.course_title).to eql('React and Redux')
  end

  it 'should be valid if association between user and favourites works' do
    user
    course
    favourite
    expect(user.favourites.first.course_id).to eql(1)
  end
end
