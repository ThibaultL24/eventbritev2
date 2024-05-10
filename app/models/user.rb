class User < ApplicationRecord
  attr_accessor :admin

  after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :attended_events, through: :attendances, source: :event

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: false

  def admin?
    # Remplacer la logique suivante par votre propre logique pour déterminer si l'utilisateur est un administrateur
    # Par exemple, si vous avez un attribut 'admin' dans votre modèle User :
    self.admin
  end

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
