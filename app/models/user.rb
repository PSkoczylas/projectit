class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :user_projects
  has_many :projects, through: :user_projects

  before_save { self.email = email.downcase }

  validates :user_name, presence: true,
                        length: {maximum: 50}
  validates :first_name, presence: true, 
                         length: {maximum: 50},
                         format: { with: /[\p{L}\p{Pd}.]/ }
  validates :last_name, presence: true, 
                        length: {maximum: 50},
                        format: { with: /[\p{L}\p{Pd}.]/ }
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
end
