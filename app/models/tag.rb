class Tag
  include Mongoid::Document
  field :title, type: String
  has_and_belongs_to_many :links

  validates :title, presence: true
  validates :title, uniqueness: true
end
