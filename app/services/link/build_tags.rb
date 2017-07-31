class Link
  class BuildTags < ApplicationService
    def initialize(link)
      @link = link
    end

    def call
      # TODO: add checking for uniqueness
      if link.tmp_tags.present?
        link.tmp_tags.split(',').map(&:strip).each do |tag|
          link.tags.build(title: tag)
        end
      end
    end

    private

    attr_reader :link
  end
end
