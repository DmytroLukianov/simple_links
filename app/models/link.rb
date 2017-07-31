class Link
  URL_REGEX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\Z/ix.freeze

  attr_accessor :tmp_tags

  include Mongoid::Document
  field :url, type: String
  field :description, type: String
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags, reject_if: :all_blank, allow_destroy: true

  validates :url, presence: true
  validates :url, format: { with: URL_REGEX }
end
