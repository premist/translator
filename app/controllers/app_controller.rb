# frozen_string_literal: true

# Controller that returns main page
class AppController < ApplicationController
  def index; end

  def healthcheck
    head :ok
  end
end
