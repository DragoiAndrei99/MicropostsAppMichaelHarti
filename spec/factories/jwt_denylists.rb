FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2025-05-25 13:34:51" }
  end
end
