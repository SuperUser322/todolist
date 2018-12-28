class TaskSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :project
  attribute :text
end
