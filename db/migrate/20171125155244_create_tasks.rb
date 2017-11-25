class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name, null: false, default: ""
      t.integer :status, null: false, default: 1
      t.text :description, default: ""
      t.integer :priority, null: false, default: 1
      t.belongs_to :project, index: true
      t.belongs_to :user, index: true
    end
  end
end
