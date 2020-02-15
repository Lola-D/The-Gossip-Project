City.destroy_all
User.destroy_all
Tag.destroy_all
Gossip.destroy_all
JoinGossipTag.destroy_all
PrivateMessage.destroy_all
JoinPrivateMessageReceiver.destroy_all
Comment.destroy_all
CommentOfComment.destroy_all
Like.destroy_all
City.reset_pk_sequence
User.reset_pk_sequence
Tag.reset_pk_sequence
Gossip.reset_pk_sequence
JoinGossipTag.reset_pk_sequence
PrivateMessage.reset_pk_sequence
JoinPrivateMessageReceiver.reset_pk_sequence
Comment.reset_pk_sequence
CommentOfComment.reset_pk_sequence
Like.reset_pk_sequence

anonymous = User.create(first_name: "anonymous", last_name: "aaa", description: Faker::Lorem.paragraph(sentence_count: 4), email: Faker::Internet.unique.email, password: "123456", age: Faker::Number.number(digits: 2), city: City.all.sample)


10.times do
  City.create(name: Faker::Address.unique.city, zip_code: Faker::Address.unique.zip)
end

50.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph(sentence_count: 4), email: Faker::Internet.unique.email, password: "123456", age: Faker::Number.number(digits: 2), city: City.all.sample)
end

10.times do
  Tag.create(title: Faker::Lorem.words)
end 

20.times do
  Gossip.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph(sentence_count: 4), user: User.all.sample)
end

Gossip.all.each do |gossip|
  rand(1..6).times do
    JoinGossipTag.create(tag: Tag.all.sample, gossip: gossip)
  end
end

5.times do
  PrivateMessage.create(sender: User.all.sample, content: Faker::Lorem.paragraph(sentence_count: 2))
  rand(1..6).times do
    JoinPrivateMessageReceiver.create(private_message: PrivateMessage.all.last, recipient: User.all.sample)
  end
end

100.times do
  Comment.create(content: Faker::Lorem.paragraph(sentence_count: 3), user: User.all.sample, gossip: Gossip.all.sample)
end

20.times do
  Like.create(content: [true, false].sample ? Gossip.all.sample : Comment.all.sample, user: User.all.sample)
end

10.times do
  CommentOfComment.create(user: User.all.sample, content: Faker::Lorem.paragraph(sentence_count: 3), comment: Comment.all.sample)
end

