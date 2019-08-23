10.times do
  Tag.create name: FFaker::Lorem.word
end

100.times do
  Post.create title: FFaker::Lorem.sentence,
    body: FFaker::Lorem.paragraphs.join * 3,
    tags: Tag.all.sample(rand(10))
end
