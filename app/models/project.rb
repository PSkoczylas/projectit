class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :tasks

  validates :name, presence: true,
                   length: { maximum: 255 }

  before_destroy :destroy_tasks

  private

  def destroy_tasks
    tasks.destroy_all
  end
end
