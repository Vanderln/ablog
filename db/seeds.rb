50.times do
  Post.create(:title => Faker::Lorem.word, 
              :content => Faker::Lorem.paragraphs(5).join,
              :author => Faker::Name.name)
end

all_posts = Post.all

50.times do 
  Tag.create(:name => Faker::Address.country, :author => Faker::Name.name)
end

all_posts.each do |post|
  post.tags << Tag.find_by_id(1 + rand(50))
end




