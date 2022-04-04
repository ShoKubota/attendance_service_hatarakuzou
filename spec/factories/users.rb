FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString" }
    crypted_password { "MyString" }
    salt { "MyString" }
    role { 1 }
    salary { 1 }
  end
end
