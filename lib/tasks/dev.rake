namespace :dev do
  desc "CONFIGURA O AMBIENTE DE DESENVOLVIMENTO"
  task setup: :environment do
    puts "Resetando o Banco de Dados"
    %x(rails db:drop db:create db:migrate)
    puts "Migrations Recriadas"

    puts "Cadastrando Tipos"
    kinds = %w(Amigo Comercial Conhecido)
    for x in kinds
      Kind.create!(
        description: x 
      )
    end
    puts "Tipos Cadastrados com Sucesso"

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

    puts "Cadastrando Telefones"
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        # phone = Phone.create!(number: Faker::PhoneNumber.cell_phone)
        # contact.phones << phone
        contact.phones.build(number: Faker::PhoneNumber.cell_phone_with_country_code)
        contact.save!
        
      end
    end
    puts "Telefones Cadastrados com Sucesso"

    puts "Cadastrando Os Endereços"
    Contact.all.each do |contact|
      adress = Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact 
      )
    end
    puts "Endereços Cadastrados com Sucesso"
  end

end
