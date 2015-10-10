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

    test "before_save" do
      user_1 = users(:one)
      user_2 = users(:two)
      assert_raises TasksManagement::OwnerIdSettedException do TasksManagement::Task.create(title: 'two owners', owners: [user_1, user_2], owner: user_1) end
    end
  end
end
