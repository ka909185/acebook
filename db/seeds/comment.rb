n = 3
while n <= 12
  content = Faker::Pokemon.name
  Comment.create(
    content: content,
    user_id: n
    topic_id: n
  )
  n = n + 1
end
