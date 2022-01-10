module ApplicationHelper
    def current_user
        @user=User.find_by_id(session[:user_id])
    end

    def signed_in?
        !!current_user
    end
end
