class User < ActiveRecord::Base

  after_create { |admin| admin.send_reset_password_instructions }

  devise :database_authenticatable,:recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  def password_required?
    new_record? ? false : super
  end
end
