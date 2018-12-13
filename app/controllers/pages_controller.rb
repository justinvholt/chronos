class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :definitions]

  def home
    if user_signed_in?
      redirect_to fixtures_path
    end
  end

  def about
  end

  def presentation
  end

  def definitions
  end
end
