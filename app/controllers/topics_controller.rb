class TopicsController < ApplicationController
  def index
    # if current_user.mothers? || user.fathers?
    @topics= Topic.all
    @newTopic= Topic.new
  # elsif current_user.students?
  # else
    end

  end

  def show
  end

  def create
    @topic = Topic.new(params[:topic].permit(:title, :role))
    if current_user.mothers? || current_user.fathers?
      @topic.role = "parents"
    elsif current_user.students?
      @topic.role = "students"
    end
    @topic.save
    redirect_to topics_index_path
  end

  def delete
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_index_path
  end
end
