class UsersController < ApplicationController
    def index 
        @users = User.all
        render json: @users
    end

    def show 
        #render json: params
        @user = User.find(params(:id))
    end

    def new 
        @user = User.new
    end

    def edit 
        user = User.find(params(:id))
    end
    

    def create 
        #user = User.new(params.require(user).permit(:name,email))
        user = User.new(user_params)
        if user.save!
            render json: user
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update 

    end

    def destroy 
        user = user.destroy
    end

    

    private 
    def user_params
        params.require(:user).permit(:name, :email)
    end

end