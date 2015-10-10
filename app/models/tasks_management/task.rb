module TasksManagement
  class Task < ActiveRecord::Base
  	cattr_accessor :user
  	has_many :sub_tasks, class_name: "Task", foreign_key: "parent_id"
  	belongs_to :parent, class_name: "Task"
  end
end
