class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


   def after_sign_in_path_for(resource)
     user = current_user

     if user.mothers? || user.fathers?
       roles_parent_path

     # else if user.children?
     #   roles_children_path
     # else
     #   roles_others_path
     end
   end



  # 省略

  private
   def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
   end


end
