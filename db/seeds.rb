User.create!(name: "Example User", email: "huyencherry13796@gmail.com",
  password: "123456", password_confirmation: "123456", role: 1)

10.times do
  Course.create!(
    name: Faker::Cat.name,
    detail: Faker::Cat.registry,
    category: Faker::Number.between(0,1)
  )
end
