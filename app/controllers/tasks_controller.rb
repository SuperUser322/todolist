class TasksController < ApplicationController
  def create
    task = Task.create(text: 'New Task', project_id: params[:project_id])
    render json: TaskSerializer.new(task).serialized_json
  end

  def destroy
    Task.destroy(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(text: params[:text], done: params[:done])
    render json: TaskSerializer.new(task).serialized_json
  end
end
