FactoryGirl.define do
  factory :address do
    line_1 "MyString"
    city "MyString"
    postal_code "MyString"
    province "MyString"
    country "MyString"
    user nil
  end
end
