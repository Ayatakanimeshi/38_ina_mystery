class UserSessionsController < ApplicationController
    def new
    end
  
    def create
      if login(params[:email], params[:password])
        redirect_back_or_to(:users, notice: 'Logged in successfully.')
      else
        flash.now.alert = 'Invalid email or password'
        render action: 'new'
      end
    end
  
    def destroy
      logout
      redirect_to(:users, notice: 'Logged out!')
    end
  end
  