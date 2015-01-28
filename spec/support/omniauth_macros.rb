module OmniauthMacros
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:odnoklassniki] = OmniAuth::AuthHash.new({
         :provider => 'odnoklassniki',
         :uid => '123545',
         :info => OmniAuth::AuthHash::InfoHash.new({
             :name => 'mockuser'
         })
     })

  end
end