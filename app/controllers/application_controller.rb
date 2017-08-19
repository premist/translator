# frozen_string_literal: true

# Controller that all other controllers inherit
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  def parameter_missing(e)
    render status: :bad_request, json: {
      error: 'Required parameter is missing',
      parameter: e.param
    }
  end
end
