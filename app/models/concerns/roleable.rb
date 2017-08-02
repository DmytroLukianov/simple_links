require 'active_support/concern'

# For cusrom roles define method @roles as array, before including Roleable
module Roleable
  extend ActiveSupport::Concern
  DEFAULT_ROLES = %w[user admin].freeze

  included do

    roles.each do |r|
      scope r, -> { where(role: r) }
    end

    roles.each do |r|
      define_method :"#{r}?" do
        role == r
      end

      define_method :"#{r}!" do
        update(role: r)
      end
    end
  end

  class_methods do
    private

    def roles
      @roles || DEFAULT_ROLES
    end
  end
end
