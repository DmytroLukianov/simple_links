require 'active_support/concern'

# For cusrom roles define method self.roler wich return array
module Roleable
  extend ActiveSupport::Concern
  DEFAULT_ROLES = %w[user admin].freeze

  included do
    self.roles.each do |r|
      scope r, -> { where(role: r) }
    end

    self.roles.each do |r|
      define_method :"#{r}?" do
        self.role == r
      end

      define_method :"#{r}!" do
        self.role = r
        save(validate: false)
      end
    end
  end

  class_methods do
    def roles
      DEFAULT_ROLES
    end
  end
end
