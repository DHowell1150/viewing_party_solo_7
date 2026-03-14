FactoryBot.define do
  factory :user do 
    name { "Jane Doe" }
    email { "jane@email.com" }
    password { "password123"}
  end
end