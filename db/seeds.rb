5.times do
  User.create(:name => Faker::Name.name, :email => Faker::Internet.email, :password => "qwerty")
end

50.times do
  Post.create(:title => Faker::Lorem.word, 
              :content => Faker::Lorem.paragraphs(5).join,
              :user_id => 1 + rand(5))
end


all_posts = Post.all

50.times do 
  Tag.create(:name => Faker::Address.country, :user_id => 1 + rand(5))
end

all_posts.each do |post|
  post.tags << Tag.find_by_id(1 + rand(50))
end




