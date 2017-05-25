

class User < ActiveRecord::Base
  include BCrypt

   # ej. User.authenticate('fernando@codea.mx', 'qwerty')
  def self.authenticate(email, user_password)
    # si el email y el password corresponden a un usuario valido, regresa el usuario
    # de otra manera regresa nil
    user = User.find_by_email(email)
    if user #necesitamos saber si se encontró el usuario
      if user_password == user.password_digest #necesitamos aparte saber si los passwords coinciden
        user
      else
        return nil
      end
    else
      return nil
    end
  end

  def password #setter
    @password ||= Password.new(password_digest)
  end

  def password=(user_password) #getter
    @password = Password.create(user_password)
    self.password_digest = @password
  end

end


