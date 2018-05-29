class ApplicationsController < ApplicationController

  def scrap_orpi
    ScarpOrpi.new(self).call
  end
end
