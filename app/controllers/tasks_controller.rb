class TasksController < ApplicationController
  def create
    task = Task.create(text: params[:text], project_id: params[:project_id])
    render json: TaskSerializer.new(task).serialized_json
  end

  def destroy
    Task.destroy(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
  end

  private

  def task_params
    params.permit(:text, :done, :deadline)
  end
end
