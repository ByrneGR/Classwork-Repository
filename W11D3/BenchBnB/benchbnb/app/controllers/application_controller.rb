class ApplicationController < ActionController::Base
    # skip_before_action :verify_authenticity_token # add this get around csrf error (will learn more on this later)

    helper_method :current_user, :logged_in?

    def login!(user)
        session[:session_token] = user.session_token
    end

    def logout!
        current_user.reset_session_token!

        session[:session_token] = nil
    end

    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by_session_token(session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def ensure_logged_in
        redirect_to new_session_url unless logged_in?
    end

end
