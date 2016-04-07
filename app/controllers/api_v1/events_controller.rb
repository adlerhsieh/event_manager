class Api::V1::EventsController < ApplicationController
  def index
    render :json => {foo: "bar"}
  end
end
