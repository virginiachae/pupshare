class Owner < ApplicationRecord
  has_many :dogs, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://i.imgur.com/3ssI9rh.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

after_create :send_admin_mail
    def send_admin_mail
        OwnerMailer.welcome_email(self).deliver

    end

end
