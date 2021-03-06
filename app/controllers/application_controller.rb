class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:index]
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        user_path(resource)
    end

    private

    def sign_in_required
        redirect_to new_user_session_url unless user_signed_in?
    end

    def correct_user
        if current_user.id != params[:id].to_i
            flash.alert = "アクセス許可されていません"
            redirect_to root_path
        end
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
