class AdminController < ApplicationController
  before_action :authenticate_administrator!
  layout 'admin/application'
end
