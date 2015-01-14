class User < ActiveRecord::Base

  def self.find_or_create_from_auth_hash(auth_hash)
    if user = User.find_by_email(auth_hash[:info][:email])
      user
    else
      User.create(
        uid: auth_hash[:uid],
        email: auth_hash[:info][:email],
        name:  auth_hash[:info][:name],
        nickname:  auth_hash[:info][:nickname]
      )
    end
  end

end
