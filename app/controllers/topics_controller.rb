class TopicsController < ApplicationController
  before_action :set_side_bar_topics, only: %i[index show]
  layout 'blog'

  def index
    @topics = Topic.all.page(params[:page]).per(5)
  end

  def show
    @topic = Topic.find(params[:id])

    if logged_in?(:site_admin)
      @blogs = @topic.blogs.recent.page(params[:page]).per(5)
    else
      @blogs = @topic.blogs.published.recent.page(params[:page]).per(5)
    end
  end

  private

  def set_side_bar_topics
    @sidebar_topics = Topic.with_blogs
  end
end
