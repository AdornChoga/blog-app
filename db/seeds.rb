# USERS

users = [{
  :name => "James",
  :photo => "https://randomuser.me/api/portraits/men/87.jpg",
  :bio => "Biology"
},{
  :name => "Samntha",
  :photo => "https://randomuser.me/api/portraits/women/60.jpg",
  :bio => "Fashion Designer"
},{
  :name => "Jane",
  :photo => "https://randomuser.me/api/portraits/women/30.jpg",
  :bio => "News Reporter"
},{
  :name => "Spencer",
  :photo => "https://randomuser.me/api/portraits/men/30.jpg",
  :bio => "Soccer Player"
}]

users.each do |user|
  User.create(name: user[:name], photo: user[:photo], bio: user[:bio], posts_counter: 0)
end

# POSTS

post_text = "Lobortis elementum nibh tellus molestie nunc.
Venenatis urna cursus eget nunc scelerisque viverra mauris
in aliquam. Et tortor consequat id porta nibh. Diam ut
venenatis tellus in metus vulputate. Pharetra convallis
posuere morbi leo urna. Mauris commodo quis imperdiet massa
tincidunt. Tincidunt eget nullam non nisi est sit amet.
Tempor commodo ullamcorper a lacus."

posts = [{
  :title => "Photosynthesis",
  :text => post_text,
  :user_id => 1
},{
  :title => "Elon Masks finally bought twitter!",
  :text => post_text,
  :user_id => 3
},{
  :title => "Easy sprained Ankle treatment",
  :text => post_text,
  :user_id => 4
},{
  :title => "10 ways you can rip your jeans",
  :text => post_text,
  :user_id => 2
},{
  :title => "Global Warming",
  :text => post_text,
  :user_id => 3
},{
  :title => "Transpiration",
  :text => post_text,
  :user_id => 1
},{
  :title => "Top 5 exercises for your core",
  :text => post_text,
  :user_id => 4
},{
  :title => "Trending fashion brands in 2022",
  :text => post_text,
  :user_id => 2
}]

posts.each do |post|
  new_post = Post.create(
    title: post[:title], text: post[:text] ,user_id: post[:user_id],
    comments_counter: 0, likes_counter: 0
    )
  new_post.update_posts_counter(User.find(new_post.user_id))
end

# COMMENTS

comments = [{
  :text => "Nemo enim ipsam",
  :user_id => 4,
  :post_id => 6
},{
  :text => "labore et dolore",
  :user_id => 3,
  :post_id => 4
},{
  :text => "Mauris commodo quis",
  :user_id => 3,
  :post_id => 3
},{
  :text => "Elementum pulvinar etiam ",
  :user_id => 1,
  :post_id => 5
},{
  :text => "perspiciatis unde omnis",
  :user_id => 2,
  :post_id => 1
},{
  :text => "Elit at imperdiet dui",
  :user_id => 2,
  :post_id => 2
},{
  :text => "Adipiscing enim eu turpis",
  :user_id => 2,
  :post_id => 5
},{
  :text => "Ornare arcu dui vivamus",
  :user_id => 3,
  :post_id => 7
},{
  :text => "Volutpat odio facilisis ",
  :user_id => 1,
  :post_id => 3
},{
  :text => "architecto beatae vitae ",
  :user_id => 1,
  :post_id => 4
},{
  :text => "natus error sit voluptatem accusantium ",
  :user_id => 3,
  :post_id => 8
},{
  :text => "Ut enim ad minima veniam",
  :user_id => 3,
  :post_id => 1
},{
  :text => "aliquid ex ea commodi",
  :user_id => 1,
  :post_id => 8
},{
  :text => "Et tortor consequat id",
  :user_id => 2,
  :post_id => 7
},{
  :text => "Maecenas ultricies mi",
  :user_id => 4,
  :post_id => 2
},{
  :text => "Et tortor consequat id",
  :user_id => 7,
  :post_id => 2
}]

comments.each do |comment|
  new_comment = Comment.create(text: comment[:text], user_id: comment[:user_id], post_id: comment[:post_id])
  new_comment.update_comments_counter(Post.find(new_comment.post_id))
end

# LIKES

likes = [{
  :user_id => 3,
  :post_id => 1
},{
  :user_id => 2,
  :post_id => 3
},{
  :user_id => 4,
  :post_id => 8
},{
  :user_id => 1,
  :post_id => 5
},{
  :user_id => 4,
  :post_id => 2
},{
  :user_id => 1,
  :post_id => 6
},{
  :user_id => 3,
  :post_id => 1
},{
  :user_id => 2,
  :post_id => 3
},{
  :user_id => 1,
  :post_id => 4
},{
  :user_id => 1,
  :post_id => 5
},{
  :user_id => 3,
  :post_id => 7
},{
  :user_id => 4,
  :post_id => 2
},{
  :user_id => 1,
  :post_id => 6
},{
  :user_id => 3,
  :post_id => 1
},{
  :user_id => 1,
  :post_id => 4
},{
  :user_id => 4,
  :post_id => 8
},{
  :user_id => 3,
  :post_id => 7
},{
  :user_id => 4,
  :post_id => 2
},{
  :user_id => 1,
  :post_id => 6
}]

likes.each do |like|
  new_like = Like.create(user_id: like[:user_id], post_id: like[:post_id])
  new_like.update_likes_counter(Post.find(new_like.post_id))
end
