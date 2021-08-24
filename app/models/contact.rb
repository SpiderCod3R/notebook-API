class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_many :phones

  def author
    "3D Academy"
  end
  
  def kind_description
    self.kind.description
  end

  def birthdate_br
    I18n.l(self.birthdate) unless self.birthdate.blank?
  end
  

  def to_br
    {
      name: self.name,
      email: self.email,
      kind: (self.kind.description if self.kind.present?),
      birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?),
    }
  end
  
  def as_json(options={})
    h = super(options)
    h[:birthdate]=(I18n.l(self.birthdate) unless self.birthdate.blank?)
    h
  end

  # def as_json(options={})
  #   super(
  #     root: true,
  #     methods: [:birthdate_br, :author, :kind_description],
  #     include: { kind: {only: :description}, phones: { only: {:}} },
  #   )
  # end
end
