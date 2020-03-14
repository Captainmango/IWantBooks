class ApplicationController < ActionController::Base

    def redir_if_not_found(resource)
        if resource == nil
            flash[:alert] = "Couldn't find what you were looking for :("
          redirect_to "/"
        end
    end

end
