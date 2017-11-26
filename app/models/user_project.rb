class UserProject < ApplicationRecord
  belongs_to :user
  belongs_to :project

  enum role: {developer: 0, manager: 1, owner: 2}
end
