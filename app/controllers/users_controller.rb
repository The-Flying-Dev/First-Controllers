class UsersController < ApplicationController
    before_action :find_user, only:[:show, :edit, :update, :destroy]

    def index 
        @users = User.all
        render json: @users
    end


    def show 
        #render json: params
        #@user = User.find(params(:id))
    end


    def new 
        @user = User.new
    end


    def edit 
        #user = User.find(params(:id))
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
        #user = User.find(params(:id))
        if user.update!(user_params)
            render json: user
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end


    def destroy 
        #user = User.find(params(:id))
        user.destroy
    end

    

    private 
    #this action locates the user instance in the database
    def find_user
        user = User.find(params(:id))
    end


    #this action only permits the following attributes to be entered in by the user, called whitelisting
    def user_params
        params.require(:user).permit(:name, :email)
    end

end