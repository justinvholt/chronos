class FixturesController < ApplicationController
  before_action :set_fixture, only: %i[show edit update]

  def index
    @fixtures = Fixture.all
  end

  def show
  end

  def new
    @fixture = Fixture.new
  end

  def create
    @fixture = Fixture.new(fixture_params)
    @fixture.save!

    redirect_to fixture_path(@fixture)
  end

  def edit
  end

  def update
    @fixture.update(fixture_params)

    # redirect_to fixture_path(@fixture)
  end

  private

  def set_fixture
    @fixture = Fixture.find(params[:id])
  end

  def fixture_params
    params.fetch(:fixture, {}).permit(:charterer, :clause_group_id, :vessel_name, :voyage_number, :demurrage_rate, :allowed_laytime,
                                    # Used for cocoon nesting forms to pass all FixtureCargo attributes and destroy method in params
                                    fixture_cargos_attributes: FixtureCargo.attribute_names.map(&:to_sym).push(:_destroy))
  end
end
