class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    topics_index_path
    # user = current_user
    #
    # if user.mothers? || user.fathers?
    #   roles_parent_path
    # elsif user.students?
    #   roles_student_path
    # else
    #   roles_others_path
    # end
  end



  def after_sign_in_path_for(resource)

    topics_index_path
    # user = current_user
    #
    # if user.admin?
    #   rails_admin_path
    # elsif user.mothers? || user.fathers?
    #   roles_parent_path
    # elsif user.students?
    #   roles_student_path
    # else
    #   roles_others_path
    # end
  end



  # 省略

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end



end
