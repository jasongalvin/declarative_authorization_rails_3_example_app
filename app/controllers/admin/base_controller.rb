class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!
  filter_access_to :all
end