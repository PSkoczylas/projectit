class UserProject < ApplicationRecord
  belongs_to :user
  belongs_to :project

  enum role: {developer: 0, manager: 1, owner: 2}

  validate :is_unique?

  protected
    def is_unique?
      duplicate = UserProject.find_by(user_id: self.user_id, project_id: self.project_id)
      binding.pry
      return duplicate
    end

  private
    def destroy_tasks
      self.tasks.destroy_all
    end

end
