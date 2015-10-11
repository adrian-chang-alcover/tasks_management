class CreateTasksManagementTasks < ActiveRecord::Migration
  def change
    create_table :tasks_management_tasks do |t|
      t.string :title
      t.text :description
      t.integer :priority
      t.integer :state
      t.integer :parent_id
      t.integer :owner_id
      t.integer :requester_id
      t.date :end_date

      t.timestamps null: false
    end
  end
end
