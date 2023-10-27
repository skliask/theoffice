class Api::V1::BaseController < ApplicationController
  before_action :authorize_access_request!
end
