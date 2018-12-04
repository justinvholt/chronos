class EventsController < ApplicationController
  before_action :set_fixture, only: [:run_chronos]

  def run_chronos
  end

  private

  def set_fixture
    @fixture = Fixture.find(params[:id])
  end
end
