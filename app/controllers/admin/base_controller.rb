class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!
  filter_resource_access
end