FactoryBot.define do
  factory :user do
    email { 'teste@treinadev.com.br' }
    login { 'treinadev' }
    password { '12345678' }
  end
end
