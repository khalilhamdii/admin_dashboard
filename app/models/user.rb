class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  after_create :send_password_reset_mail

  validates :full_name, presence: true, length: { minimum: 4 }
  validates :phone_number, presence: true, length: { minimum: 4 } 
  validates_format_of :phone_number,
  with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/
  validates :company_name, presence: true, length: { minimum: 4 }
  validates :company_address, presence: true, length: { minimum: 4 }



def send_password_reset_mail
  UserMailer.send_password_reset(self).deliver_later
end
end
