class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  after_create :send_password_reset_mail
def send_password_reset_mail
  UserMailer.send_password_reset(self).deliver_later
end
end
