require "debug"
class UsersController < ApplicationController
  def new 
    @user = User.new
  end

  def create

    @user = User.new(user_params)

    if @user.save 
      
      auto_login(@user)

      redirect_to  new_story_path
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました'
      redirect_to action: :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
