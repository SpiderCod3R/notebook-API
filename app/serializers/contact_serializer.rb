class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  def attributes(*args)
    h = super(*args)
    # Retorna no Formato pt-BR
    # h[:birthdate]=object.birthdate_br
    h[:birthdate]=object.birthdate.to_time.iso8601
    h
  end
end
