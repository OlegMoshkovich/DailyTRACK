class UsersController < ApplicationController


def index
	@users = User.all
	@user = current_user.email
end

end
