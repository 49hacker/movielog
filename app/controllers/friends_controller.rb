#encoding: utf-8

class FriendsController < ApplicationController
  def follow
    @my_id = '1' #いずれセッションを使う
    @is_following = Friend.is_following(@my_id, params[:id])
    if @is_following
      redirect_to user_path(params[:id]), notice: 'すでにフォローしています'
    else
      @friend = Friend.new(:following_id => @my_id, :followed_id => params[:id])
      @friend.save
      redirect_to user_path(params[:id]), notice: 'フォロー成功！'
    end
  end

  def unfollow 
    @my_id = '1' #いずれセッションを使う 
    @following = Friend.following(@my_id, params[:id]) 
    if @following.present? 
      @following.destroy
      redirect_to user_path(params[:id]), notice: 'フォロー解除！' 
    else 
      redirect_to user_path(params[:id]), notice: 'フォローしていないユーザです' 
    end 
  end  
end
