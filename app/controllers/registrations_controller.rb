class RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
   params.require(:user).permit(:name , :email, :password, :password_confirmation, :profession, :service,:type)
  end
 
  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :status,:profession, :service)
  end

end
