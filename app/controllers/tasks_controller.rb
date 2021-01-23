#  this is the controller
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new # needed to instantiate the form_for
  end

  def show
    # raise
    # @tasks = Task.all
    find_task
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    find_task
    # raise
  end

  def update
    find_task
    @task.update(task_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to task_path(@task)
  end


  def destroy
    find_task
    @task.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end

#   def complete
#     find_task
#     p "inside complete"
#     p "complete = #{params[:complete]}"
#     @task.complete =
#       if @task.update_attributes(Task.find(params[:id]).as_json({except: [:created_at, :updated_at]}))
#         p "inside update"
#         render :text => "success"
#       else
#         p "inside error"
#       end

#       <%= check_box_tag 'complete', '1', t.complete, {
#   onchange: "$(this).data('params', 'complete=' + this.checked)",
#   data: { url: url_for(action: 'complete', id: task.id,), remote: true, method: :patch },
# } %>
#   end
