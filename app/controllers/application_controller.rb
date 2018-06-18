class ApplicationController < ActionController::Base
    include Pundit
    # after_action :verify_authorized, except: :index
    # before_action :authenticate_user!
end
