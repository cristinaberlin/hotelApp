class ApplicationController < ActionController::Base

    def admin?
        if current_user && current_user.admin?
      end
      

    #putting this method here makes it available across whole application
    def ensure_admin
        unless admin?  # Using the admin? method
          respond_to do |format|
            format.html { redirect_to root_path, notice: 'Please contact the administrator to complete this action.' }
            format.json { head :no_content }
          end
        end
    end
  end
end
  
