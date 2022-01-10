class ApplicationController < ActionController::Base
    include ApplicationHelper

    private 

    def redirect_if_not_signed_in
        flash[:error]="You must be signed in to view this page." if !signed_in?
        redirect_to login_path if !signed_in?
    end
end
