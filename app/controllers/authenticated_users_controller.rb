class AuthenticatedUsersController < ApplicationController
  before_filter :authenticate_user!
end
