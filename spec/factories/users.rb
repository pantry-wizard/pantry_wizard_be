FactoryBot.define do
  factory :user do
    username { "MyString" }
    email { "MyString" }
    password { "MyString" }
    intolerances { "MyString" }
    likes { "MyString" }
    dislikes { "MyString" }
    dietary_restrictions { "MyString" }
    google_id { "MyString" }
  end
end
