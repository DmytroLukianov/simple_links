class Link
  class FindByTag < ApplicationFinder
    def initialize(tag_title: '*')
      @tag_title = tag_title
    end

    def call
      Tag.find_by(title: tag_title).try(:links)
    end

    private

    attr_reader :tag_title
  end
end
