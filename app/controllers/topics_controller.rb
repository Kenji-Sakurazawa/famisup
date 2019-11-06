class TopicsController < ApplicationController
  before_action :authenticate

  def authenticate
    redirect_to new_user_registration_url unless user_signed_in?
  end
  # before_filter :authenticate_user!

  def index
    # if current_user.mothers? || user.fathers?
    @topics = Topic.all
    @newTopic = Topic.new
    # elsif current_user.students?
    # else
    # end

  end

  # def show
  #   @topic = Topic.find(params[:id])
  #   @newpost = Post.new(topic_id: params[:id])
  #   @post = Post.where(topic_id: params[:id])
  # end

  def create
    @topic = Topic.new(topic_params)
    # @topic = Topic.new(params.require(:topic).permit(:title, :role))
    # if current_user.mothers? || current_user.fathers?
    #   @topic.role = "parents"
    # elsif current_user.students?
    #   @topic.role = "students"
    # end
    @topic.save
    redirect_to topics_index_path
  end


  def delete
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_index_path
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :role)
  end

end
