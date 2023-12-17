class ApplicationController < ActionController::Base

    def admin?
        if current_user && current_user.admin?
          return admin
        end
      end
      

    #putting this method here makes it available across whole application
    def ensure_admin
        unless current user && current_user.admin?

            respond_to do |format|
                format.html {redirect_to root_path, notice: 'Please contact the administrator to complete this action.'}
                format.json {head :no_content}
            end
        end
    end    
end
