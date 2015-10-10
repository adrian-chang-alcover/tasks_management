require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "has_many_owner_tasks" do
  	user = users(:one)
  	assert_equal TasksManagement::Task::ActiveRecord_Associations_CollectionProxy, user.owner_tasks.class
  end

  test "has_many_requester_tasks" do
  	user = users(:one)
  	assert_equal TasksManagement::Task::ActiveRecord_Associations_CollectionProxy, user.requester_tasks.class
  end
end
