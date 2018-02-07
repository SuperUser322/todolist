class Task < ApplicationRecord
  belong_to :project
  validates :text, :project, precence: true
end

Task.create(text: "Task").valid? # => true
Task.create(text: nil).valid? # => false
Project.create(project: "Project").valid? # => true
Project.create(project: nil).valid? # => false
