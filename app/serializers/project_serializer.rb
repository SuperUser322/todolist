class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attribute :title
end

render json: ProjectSerializer.new(title).serialized_json
