class TasksController < ApplicationController
  def create
    task = Task.create(text: 'New Task', project_id: params[:project_id])
    render json: TaskSerializer.new(task).serialized_json
  end

  def destroy
    Task.destroy(params[:id])
  end

end
