module TasksManagement
  class Task < ActiveRecord::Base
  	attr_accessor :owners

  	has_many :sub_tasks, class_name: "Task", foreign_key: "parent_id"
  	belongs_to :parent, class_name: "Task"

  	enum priority: [:high, :medium, :low]
  	enum state: [:pending, :rejected, :started, :finished, :accepted]

  	after_save do
  		unless self.owners.blank?
  			raise TasksManagement::OwnerIdSettedException unless self.owner.blank?  			
  			self.owners.each do |owner|
  				TasksManagement::Task.create(title: title, description: description, priority: priority, state: state, parent_id: id, owner: owner, requester: requester, end_date: end_date)
  			end
  		end
  	end

  	def start!
  		raise TasksManagement::InvalidTaskStateException unless self.state == 'pending' or self.state == 'rejected'
  		self.started!
  	end

  	def finish!
  		raise TasksManagement::InvalidTaskStateException unless self.state == 'started'
  		self.finished!
  	end

  	def accept!
  		raise TasksManagement::InvalidTaskStateException unless self.state == 'finished'
  		self.accepted!
  	end

  	def reject!
  		raise TasksManagement::InvalidTaskStateException unless self.state == 'finished'
  		self.rejected!
  	end
  end
end
