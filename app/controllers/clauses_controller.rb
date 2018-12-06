class ClausesController < ApplicationController
  before_action :set_clause, only: [:show, :assign, :edit, :update]

 def index
    if params[:query].present?
      @clauses = Clause.search_by_cp_form_and_paragraph_and_wording(params[:query])
    else
      @clauses = Clause.all
    end
  end

  def new
    @clause = Clause.new
  end

  def show
  end

  def create
    @clause = Clause.new(clause_params)
    if @fixture_cargo.save
      redirect_to clauses_path
    else
      redirect_to clauses_path
    end
  end

  def assign
    # assign the clause to a clauses_group (such as a fixture or a COA or industry-contract)
  end

  def edit
    # if a bloc is added this should only be accessible by an administrator. users are not allowed to edit/delete clauses
    # before a bloc is added, the user can delete
  end

  def update
    # this should only be accessible by an administrator. users are not allowed to edit/delete clauses
    @clause.update(clause_params)
    redirect_to clause_path
  end

  def destroy
    # if a bloc is added this should only be accessible by an administrator. users are not allowed to edit/delete clauses
    # before a bloc is added, the user can delete
    @clause.destroy
    redirect_to clause_path
  end

  private

  def set_clause
    @clause = Clause.find(params[:id])
  end

  def clause_params
    params.require(:clause).permit(:title, :paragraph, :wording, :bloc)
  end
end
