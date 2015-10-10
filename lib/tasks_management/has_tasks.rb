class ActiveRecord::Base 
	def self.has_tasks
		has_many :owner_tasks, class_name: 'TasksManagement::Task', foreign_key: :owner_id
		has_many :requester_tasks, class_name: 'TasksManagement::Task', foreign_key: :requester_id
	end
end