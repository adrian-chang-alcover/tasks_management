class ActiveRecord::Base 
	def self.has_tasks
		has_many :owner_tasks, class_name: 'TasksManagement::Task', foreign_key: :owner_id
		has_many :requester_tasks, class_name: 'TasksManagement::Task', foreign_key: :requester_id

		user_class = self
		TasksManagement::Task.class_eval do
			belongs_to :owner, class_name: user_class.name
			belongs_to :requester, class_name: user_class.name
		end
	end
end