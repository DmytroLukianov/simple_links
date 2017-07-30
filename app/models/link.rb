class Link
  URL_REGEX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\Z/ix.freeze

  include Mongoid::Document
  field :url, type: String
  field :description, type: String
  has_and_belongs_to_many :tags

  validates :url, presence: true
  validates :url, format: { with: URL_REGEX }
end
