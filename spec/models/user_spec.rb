require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user)  { build(:user, role: 'admin', first_name: 'Vasia', last_name: 'Pupkin') }
  it 'should concat first name and last name' do
    expect(user.full_name).to eq [user.first_name, user.last_name].join(' ')
  end

  it 'should have methods for roles' do
    expect(user.admin?).to eq true
  end
end
