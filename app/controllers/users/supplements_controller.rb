class Users::SupplementsController < ApplicationController
  def index
    @supplements = Supplement.all
  end

end