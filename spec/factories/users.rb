FactoryBot.define do
  factory :user do
    name              {'test'}
    email                 {'test@example'}
    password              {'123abc'}
    password_confirmation {password}
  end
end