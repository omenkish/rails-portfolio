User.create!(
  email: 'test@test.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Admin User',
  roles: 'site_admin'
)
puts "1 admin user created"

User.create!(
  email: 'test2@test.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Regular User',
)
puts "1 regular user created"

3.times do |topic|
  Topic.create!(
    title: "#{Faker::ProgrammingLanguage.name.capitalize} Programming Language"
  )
end

puts '3 Topics created'

10.times do |blog|
  Blog.create!(
    title: "My Blog Post Number #{blog + 1}",
    body: Faker::Quotes::Shakespeare.hamlet_quote,
    topic: Topic.last
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
    title: Faker::Book.title,
    subtitle: Faker::GreekPhilosophers.quote,
    body: Faker::Lorem.sentence(word_count: rand(20..50)),
    main_image: 'http://placehold.it/600x400',
    thumb_image: 'http://placehold.it/350x200'
  )
end

puts '9 portfolio items created'

%w[Python GraphQL SQL Rails MERN].each do |technology_item|
  Portfolio.last.technologies.create!(name: technology_item)
end

puts '5 technologies created'
