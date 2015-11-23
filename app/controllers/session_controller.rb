class SessionController < ApplicationController

  def create
    current_user = User.find_by(email: user_params[:email])

    if current_user && current_user.authenticate(user_params[:password])
      session[:current_user_id] = current_user.id
      redirect_to application_angular_path

   else
     flash[:message] = "Email / Password combo does not exist!"
     session[:current_user_id] = nil
     redirect_to root_path
   end

  end

  def destroy
    session[:current_user_id] = nil
    render json: {
      message: "you ouuuut"
    }
    redirect_to root_path
  end

  private

  def user_params
    return params.require(:user).permit(:email, :password)
  end


end
