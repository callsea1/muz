# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




users = ['test.1@gmail.com', 'test.2@gmail.com', 'test.3@gmail.com', 'test.4@gmail.com'].map do |email|
	User.create({:email => email, :password => 'hockey', :password_confirmation => 'hockey'})
end

song_rooms = users.each_with_index do |user, index|
	SongRoom.create(:user_id => user.id, :title => "TestRoom #{index+1}")
end

