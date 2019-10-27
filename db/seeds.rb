10.times do |blog|
  Blog.create!(
    title: "My Blog Post Number #{blog + 1}",
    body: Faker::Quotes::Shakespeare.hamlet_quote
  )
end

puts '10 blog posts created'

%w[Python GraphQL SQL Rails MERN].each_with_index do |skill, index|
  Skill.create!(
    title: skill.to_s,
    percent_utilized: (index + 1) * 7
  )
end

puts '5 skills created'

9.times do |portfolio_item|
  Portfolio.create!(
    title: Faker::Lorem.sentence(word_count: 4),
    subtitle: Faker::Lorem.sentence(word_count: 7),
    body: Faker::Lorem.sentence(word_count: rand(20..50)),
    main_image: 'http://placehold.it/600x400',
    thumb_image: 'http://placehold.it/350x200'
  )
end

puts '9 portfolio items created'
