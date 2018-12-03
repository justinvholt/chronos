class FixtureCargoesController < ApplicationController
  before_action :set_fixture_cargo, only: [:edit, :update, :destroy]

  def index
    @fixture_cargoes = FixtureCargo.all
  end

  def new
    @fixture_cargo = FixtureCargo.new
  end

  def create
    @fixture_cargo = FixtureCargo.new(fixture_cargo_params)
    @fixture_cargo.fixture_id = @fixture
    if @fixture_cargo.save
      redirect_to fixture_path
    else
      redirect_to fixture_path
    end
  end

  def edit
  end

  def update
    @fixture_cargo.update(fixture_cargo_params)
    redirect_to fixture_path
  end

  def destroy
    @fixture_cargo.destroy
    redirect_to fixture_path
  end

  private

  def set_fixture_cargo
    @fixture_cargo = FixtureCargo.find(params[:id])
  end

  def fixture_cargo_params
    params.require(:fixture_cargo).permit(:name, :quantity_mts, :fixture, :load_port, :load_terminal, :load_berth, :disch_port, :disch_terminal, :disch_berth)
  end
end

