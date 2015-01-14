class User < ActiveRecord::Base

  def current_user

  end

  def self.find_or_create_from_auth_hash(auth_hash)
    if user = User.find_by_email(auth_hash[:info][:email])
      user
    else
      User.create(
        email: auth_hash[:info][:email]
      )
    end
  end

end
