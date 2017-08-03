require 'rails_helper'

RSpec.describe Link::FindByTag do
  let!(:tag1) { create(:tag) }
  let!(:tag2) { create(:tag) }
  let!(:tag3) { create(:tag) }
  let!(:link)  { create(:link, tags: [tag1, tag3]) }
  let!(:link2)  { create(:link, tags: [tag2]) }

  it 'links should include first link' do
    expect(described_class.call(tag_title: tag3.title)).to include link
  end
end
