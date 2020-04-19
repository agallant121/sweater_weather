FactoryBot.define do
  factory :user do
    email { Faker::Book.author }
    password { Faker::Creature::Animal }
  end
end
