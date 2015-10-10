module TasksManagement
  class Task < ActiveRecord::Base
  	has_many :sub_tasks, class_name: "Task", foreign_key: "parent_id"
  	belongs_to :parent, class_name: "Task"

  	enum priority: [:high, :medium, :low]
  	enum state: [:pending, :started, :finished, :accepted]
  end
end
