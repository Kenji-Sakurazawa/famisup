class PostController < ApplicationController

  def show
    @topic = Topic.find(params[:id])
    @newpost = Post.new(topic_id: params[:id])
    if current_user.mothers? || current_user.fathers?
      @post = Post.where(topic_id: params[:id]).joins(:user).where(users: {id: current_user.id}).or(Post.where(topic_id: params[:id]).joins(:user).where(users: {role: "students"} ))
    elsif current_user.students?
      @post = Post.where(topic_id: params[:id]).joins(:user).where(users: {id: current_user.id}).or(Post.where(topic_id: params[:id]).joins(:user).where(users: {role: ["mothers", "father"]}))
    elsif current_user.admin?
      @post = Post.where(topic_id: params[:id])
    else
      @post = Post.where(topic_id: params[:id]).limit(5)
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_show_path(@post.topic_id), notice: '新規投稿されました'
    else
      render :show, alert: '新規投稿できませんでした'
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
     @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to post_show_path(@post.topic_id), notice: '編集されました'
    else
      render :edit, alert: '編集できませんでした'
    end
  end

  def destroy
     @post = Post.find_by(id: params[:id])
     @topic_id = @post.topic_id
     @post.destroy
     redirect_to post_show_path(@topic_id)
  end

  private
  def post_params
    params.require(:post).permit(:topic_id, :name, :body)
  end

end
