class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project

  enum status: {todo: 0, in_progress: 1, code_review: 2, done: 3}
  enum priority: {low: 0, normal: 1, high: 2}

  validates :name, presence: true,
                   length: {maximum: 255}
  validates :status, presence: true
  validates :priority, presence: true
end
