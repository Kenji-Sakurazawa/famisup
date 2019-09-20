class ApplicationController < ActionController::Base


  before_action :configure_permitted_parameters, if: :devise_controller?

  # 省略

  private
   def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
   end


end
