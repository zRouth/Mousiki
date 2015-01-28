FactoryGirl.define do
  factory :user do
    name 'Cave Johnson'
    email 'cave@aperturelabs.com'
    password 'foobar'
    uid 'abc123'
    nickname 'cave'
    token 'def456'
  end

  factory :auth_hash do
    provider 'spotify'
    credential 'abc123'
    token 'def456'
    name 'Doug Rattman'
    nickname 'rattman'
    email 'doug@aperturelabs.com'
    uid '123abc'
  end

  factory :artist do
    name 'sade'
    date '2015-01-01'
    time '10:00:00'
    venue 'Royal Albert Hall'
  end
end
