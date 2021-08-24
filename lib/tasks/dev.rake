namespace :dev do
  desc "CONFIGURA O AMBIENTE DE DESENVOLVIMENTO"
  task setup: :environment do

    kinds = %w(Amigo Comercial Conhecido)
    for x in kinds
      Kind.create!(
        description: x 
      )
    end

    puts "Cadastrando Contatos"
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name_with_middle,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "Contatos Cadastrados com Sucesso"
  end

end
