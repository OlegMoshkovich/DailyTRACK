class UsersController < ApplicationController
before_action :authenticate_user!
def index
	@user = current_user
	@user_a = current_user
end

def show
	@user = current_user
end


end
