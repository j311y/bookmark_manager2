require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id,            Serial
  property :email,         String
  property :password_hash, String

  # def password
  #   @password ||= Password.new(password_hash)
  # end

  def password=(password)
    self.password_hash = BCrypt::Password.create(password)
  end

end
