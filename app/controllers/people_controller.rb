class PeopleController < ApplicationController
  def index
    if current_user
      if params[:search].present? || params[:radius].present?
        search =Person.search do
          fulltext params[:search]
          if current_user.has_location?
            with(:location).in_radius(current_user.lat, current_user.lon, params[:radius])
          end
        end

        @people = search.results
      else
        @people = []
      end
    else
      @new_person = Person.new
    end
  end
end