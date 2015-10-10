module TasksManagement
  class Task < ActiveRecord::Base
  	attr_accessor :owners

  	has_many :sub_tasks, class_name: "Task", foreign_key: "parent_id"
  	belongs_to :parent, class_name: "Task"

  	enum priority: [:high, :medium, :low]
  	enum state: [:pending, :started, :finished, :accepted]

  	before_save do
  		unless self.owners.blank?
  			raise TasksManagement::OwnerIdSettedException unless self.owner.blank?  			
  		end
  	end
  end
end
