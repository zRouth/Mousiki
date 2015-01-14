class User < ActiveRecord::Base

  def find_or_create_from_auth_hash(auth_hash)
    if user = User.find_by_email(auth_hash[:info][:email])
      user
    else
      User.create(
        email: auth_hash[:info][:email]
      )
    end
  end

end
