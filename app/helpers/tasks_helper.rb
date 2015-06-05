module TasksHelper
  def task_comment_if_exists
    if @task.comment
      @task.comment
    end
  end
end
