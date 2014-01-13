require 'spec_helper'

describe AuthenticatedUsersController do
  before_filter :authenticate_user!
end
