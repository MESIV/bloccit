require 'random_data'

15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

50.times do
  Post.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

 50.times do
   SponsoredPost.create!(
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     price:  Random.rand(1..1000)
   )
 end
 sponsored_posts = SponsoredPost.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

 unique_post = Post.find_or_create_by(title: "Random Title", body: "Random Body")
 Comment.find_or_create_by(post: unique_post, body: "Random Body")

 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{SponsoredPost.count} sponsored posts created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
