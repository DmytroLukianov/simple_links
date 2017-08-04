require 'rails_helper'

RSpec.describe LinksController do
  login_user

  let!(:tag1) { create(:tag) }
  let!(:tag2) { create(:tag) }
  let!(:tag3) { create(:tag) }
  let!(:link)  { create(:link, user: subject.current_user, tags: [tag1, tag3]) }
  let!(:link2)  { create(:link, tags: [tag2]) }

  it 'should search by tag name' do
    get :index, params: { tag: tag2.title }
    expect(assigns(:links)).to eq tag2.links
  end

  it 'should return links for current user' do
    get :my
    expect(assigns(:links)).to eq subject.current_user.links
  end
end
