class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones
  accepts_nested_attributes_for :phones, allow_destroy: true
  has_one :address
  accepts_nested_attributes_for :address, update_only: true

  # validations
  validates :kind, :address, presence: true

  def author
    "3D Academy"
  end
  
  def kind_description
    self.kind.description if self.kind.present?
  end

  def birthdate_br
    I18n.l(self.birthdate) unless self.birthdate.blank?
  end

  def to_br
    {
      name: self.name,
      email: self.email,
      kind: kind_description,
      birthdate: birthdate_br,
    }
  end
  
  def as_json(options={})
    h = super(options)
    h[:birthdate]=birthdate_br
    h
  end

  # def as_json(options={})
  #   super(
  #     root: true,
  #     methods: [:birthdate_br, :author, :kind_description],
  #     include: { kind: {only: :description}, phones: { only: {:number} } },
  #   )
  # end
end
