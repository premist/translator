# frozen_string_literal: true

# Controller that all other controllers inherit
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
