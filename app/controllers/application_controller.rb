class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_tasks = user.tasks.count
  end
  
  def forbid_login_user
    if session[:user_id] != nil
      flash[:danger] = "すでにログインしています！"
      redirect_to root_url
    end
  end
  
  def ensure_correct_task
    @task = Task.find(params[:id])
    if @task.user_id != current_user.id
      flash[:danger] = "権限がありません"
      redirect_to root_url
    end
  end
  
  def ensure_correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      flash[:danger] = "権限がありません"
      redirect_to root_url
    end
  end
end
