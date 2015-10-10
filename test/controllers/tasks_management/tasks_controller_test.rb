require 'test_helper'

module TasksManagement
  class TasksControllerTest < ActionController::TestCase
    setup do
      @task = tasks_management_tasks(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:tasks)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create task" do
      assert_difference('Task.count') do
        post :create, task: { description: @task.description, end_date: @task.end_date, file: @task.file, owner_id: @task.owner_id, parent_id: @task.parent_id, priority: @task.priority, requester_id: @task.requester_id, state: @task.state, title: @task.title }
      end

      assert_redirected_to task_path(assigns(:task))
    end

    test "should show task" do
      get :show, id: @task
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @task
      assert_response :success
    end

    test "should update task" do
      patch :update, id: @task, task: { description: @task.description, end_date: @task.end_date, file: @task.file, owner_id: @task.owner_id, parent_id: @task.parent_id, priority: @task.priority, requester_id: @task.requester_id, state: @task.state, title: @task.title }
      assert_redirected_to task_path(assigns(:task))
    end

    test "should destroy task" do
      assert_difference('Task.count', -1) do
        delete :destroy, id: @task
      end

      assert_redirected_to tasks_path
    end
  end
end
