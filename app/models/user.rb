class User < ActiveRecord::Base
  
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true 
  validates :email, format: { without: /\s/, message: "must contain no spaces" }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }

  
  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    user = User.find_by_email(email)
   
    if(user && user.authenticate(password))
      @user = user
    else
      @user = nil
    end
  end
  
end
