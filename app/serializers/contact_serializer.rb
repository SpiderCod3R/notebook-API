class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind do
    link(:related) { contact_kind_url(object.id) }
  end

  has_many :phones do
    link(:related) { contact_kind_url(object.id) }
  end

  has_one :address

  meta do 
    { "made-on": "UDEMY JACKSON PIRES - Desenvolvendo REST / RESTful APIs com Ruby on Rails" }
  end

  # link(:self) { contact_url(object) }

  def attributes(*args)
    h = super(*args)
    # Retorna no Formato pt-BR
    # h[:birthdate]=object.birthdate_br
    h[:birthdate]=object.birthdate.to_time.iso8601
    h
  end
end
