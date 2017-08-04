require 'rails_helper'

RSpec.describe Link::BuildTags do
  let!(:link)  { build(:link, tmp_tags: 'ruby, rails, development') }
  let!(:link_with_tags)  { described_class.call(link) }

  it 'should build tags from tmp_tags string' do
    expect(link_with_tags.tags.size).to eq 3
    expect(link_with_tags.tags.first.title).to eq 'ruby'
  end
end
