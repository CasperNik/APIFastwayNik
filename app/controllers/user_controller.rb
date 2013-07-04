class UserController < ApplicationController

  def index
    @user=User.all
     respond_to do |format|
       format.html
       format.json {render json: @user}
     end
  end
  def new

  end
  def create
    @user=User.new(params[:user])
    @user.save
    redirect_to user_index_path
  end
  def show
    @user=User.find(params[:id])
  end

  private
  def post_params
    params.require(:user).permit(:address, :email, :name, :soname)
  end

end
