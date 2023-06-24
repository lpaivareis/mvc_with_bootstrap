# frozen_string_literal: true

User.create!(
  name: 'Lucas',
  email: 'lucas@teste.com',
  password: '123456'
)

roles = ['Assistente de Sistemas', 'Consultor', 'Estagiário de RH', 'Analista Financeiro', 'Analista de Sistema',
         'Desenvolvedor Ruby']

roles.each do |role|
  Role.create!(
    name: role
  )
end

100.times do
  rand = Random.rand(1..6)

  Employee.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    register_number: Faker::Number.number(digits: 8),
    cpf: Faker::Number.number(digits: 11),
    role_id: rand
  )

  Rails.logger.debug { "Employee #{Employee.last.name} created!" }
end
