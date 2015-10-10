# TasksManagement

TasksManagement is for a simple tasks management. 
TasksManagement permits set title, description, state, priority, owner, requester, task parent, end date and attach a file for any task.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tasks_management'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tasks_management

## Usage

A task can have the following states: pending, rejected, started, finished and accepted. You can set an specific state using the methods: start!, finish!, accept! and reject!

Also, you can define priorities to any task: low, medium and high. You can set these priorities using the methods low!, medium! and high!

Every task has a requester (the person who created the task) and an owner (the person who must do the task). A task can have a parent task. For example, if you want to set more than one owner to a single task, the system will create a main task and subtasks for each owner.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/tasks_management/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
