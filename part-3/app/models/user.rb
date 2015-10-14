class PasswordValidator < ActiveModel::Validator
  def validate(record)
    if record.password_validation.length < 6
      record.errors[:base] << "Your password must exceed 6 characters"
    end
  end
end

class User < ActiveRecord::Base

  include BCrypt

  has_many :auctions

  validates_with PasswordValidator
  validates :username, uniqueness: true
  validates :username, :password, presence: true

  attr_reader :password_validation

  def self.authenticate(params)
    @user = User.find_by(username: params[:username])
    if @user 
      return @user if @user.password == params[:password]
    end
    return nil
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password_validation = new_password
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
