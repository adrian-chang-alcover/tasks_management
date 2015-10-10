require 'test_helper'

module TasksManagement
  class TaskTest < ActiveSupport::TestCase
    test "the truth" do
      assert true
    end

    test "belongs_to_owner" do
    	task = tasks_management_tasks(:one)
    	user = users(:one)
    	task.owner = user
    	assert_equal user, task.owner
  	end

  	test "belongs_to_requester" do
      	task = tasks_management_tasks(:one)
      	user = users(:one)
      	task.requester = user
      	assert_equal user, task.requester
  	end

    test "after_save" do
      user_1 = users(:one)
      user_2 = users(:two)
      assert_raises TasksManagement::OwnerIdSettedException do TasksManagement::Task.create(title: 'two owners', owners: [user_1, user_2], owner: user_1) end

      task = TasksManagement::Task.create(title: 'two owners', owners: [user_1, user_2], requester: user_1)
      task.sub_tasks.each do |t|
        assert_instance_of TasksManagement::Task, t
        assert_equal task.title, t.title
        assert_equal task.id, t.parent_id
        assert_includes task.owners, t.owner
      end
    end

    test "start!" do
      task = TasksManagement::Task.new
      task.pending!
      
      task.start!
      assert_equal 'started', task.state

      assert_raises TasksManagement::InvalidTaskStateException do task.start! end
    end
  end
end
