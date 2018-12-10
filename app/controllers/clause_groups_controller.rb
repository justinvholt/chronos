class ClauseGroupsController < ApplicationController
  ##TODO: crud methods for clause_group
  def index
    @clause_groups = Clause_group.all
  end

  def new
     @clause_group = Clause_group.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

 private

  def set_clause
    @clause_group = Clause_group.find(params[:id])
  end

  #def clause_params
#    params.require(:clause_group).permit(:name)
#  end
end

