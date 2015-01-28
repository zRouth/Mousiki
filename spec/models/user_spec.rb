require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) do
    FactoryGirl.create(:user)
  end

  hash = {
    uid: '123abc',
    provider: 'spotify',
    credentials: { token: 'abc123' },
    info: { name: 'Doug Rattman', nickname: 'rattman',
            email: 'doug@aperturelabs.com' }
  }

  hash2 = {
    uid: 'abc123',
    provider: 'spotify',
    credentials: { token: 'ghi789' },
    info: { name: 'Cave Johnson', nickname: 'cave',
            email: 'cave@aperturelabs.com' }
  }

  it 'is valid' do
    expect(user).to be_valid
  end

  it 'can create a user' do
    expect(User.count).to eq(1)
    User.find_or_create_from_auth_hash(hash)
    expect(User.count).to eq(2)
  end

  it 'can update user attributes from hash' do
    User.find_or_create_from_auth_hash(hash2)
    expect(user.token).to eq('def456')
  end
end
