class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects 

  validates :name, presence: true
end
