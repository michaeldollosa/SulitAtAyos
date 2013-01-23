class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @products = User.find(params[:id]).products.paginate(:page => params[:page], :per_page => 5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:product])
    redirect_to @user
  end

  def profile
    @user = current_user
    @products = current_user.products.paginate(:page => params[:page], :per_page => 10)
    @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 8)
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def inventory
    @user = current_user
    @products = current_user.products.paginate(:page => params[:page], :per_page => 10)
  end

end
