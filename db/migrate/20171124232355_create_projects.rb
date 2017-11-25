class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name, null: false, default: ""
      t.text :description, default: ""
    end
  end
end
