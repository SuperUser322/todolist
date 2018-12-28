class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  has_many :tasks
  attribute :title
end
