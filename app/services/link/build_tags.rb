class Link
  class BuildTags < ApplicationService
    def initialize(link)
      @link = link
    end

    def call
      if link.tmp_tags.present?
        tmp_tags = []
        link.tmp_tags.split(',').map(&:strip).each do |tag|
          tmp_tags << Tag.find_or_initialize_by(title: tag)
        end
        link.assign_attributes(tags: tmp_tags)
      end
    end

    private

    attr_reader :link
  end
end
