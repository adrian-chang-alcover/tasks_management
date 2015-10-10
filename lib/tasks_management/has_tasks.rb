class ActiveRecord::Base 
	def self.has_tasks
		has_many :owner_tasks, class_name: 'TasksManagement::Task', foreign_key: :owner_id
		has_many :requester_tasks, class_name: 'TasksManagement::Task', foreign_key: :requester_id

		TasksManagement::Task.user = self
		TasksManagement::Task.class_eval do
			belongs_to :owner, class_name: self.user.name
			belongs_to :requester, class_name: self.user.name
		end
	end
end