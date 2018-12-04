class FixturesController < ApplicationController
  before_action :get_fixture, only: %i[edit update]

  def index
    @fixtures = Fixture.all
  end

  def new
    @fixture = Fixture.new
  end

  def create
    @fixture = Fixture.new(fixture_params)
    @fixture.save!

    redirect_to edit_fixture_path(@fixture)
  end

  def edit
  end

  def update
    @fixture.update(fixture_params)

    redirect_to edit_fixture_path(@fixture)
  end

  private

  def set_fixture
    @fixture = Fixture.find(params[:id])
  end

  def fixture_params
    params.require(:fixture).permit(:charter, :vessel_name, :voyage_number, :demurrage_rate, :allowed_laytime)
  end

  def cargo_params
    params.require(:fixture_cargos).permit(:name, :quantity_mts, :load_port, :load_terminal, :load_berth, :disch_port, :disch_berth, :disch_terminal)
  end
end
