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
  end
end
