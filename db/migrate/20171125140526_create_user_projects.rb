class CreateUserProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :user_projects do |t|
      t.belongs_to :project, index: true
      t.belongs_to :user, index: true
      t.integer :role, default: 0, null: false
    end
  end
end
