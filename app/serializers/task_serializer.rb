class TaskSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :project
  attributes :text, :done, :deadline
end
