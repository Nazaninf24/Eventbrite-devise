class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :attendances
  has_many :events, through: :attendances
  has_many :administrated_events, class_name: 'Event', foreign_key: 'admin_id'
  after_create :welcome_send

  private 

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end