class StaticPagesController < ApplicationController

  skip_before_action :only_signed_in

  def team

  end

  def contact

  end

end