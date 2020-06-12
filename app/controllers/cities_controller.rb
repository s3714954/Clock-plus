class CitiesController < ApplicationController

    def toggle
        city = City.find_by(name: city_params[:name])
        city ||= City.find(params[:id])
        unless city.nil?
            city.toggled = city_params[:toggled]
            city.touch
            city.save
        end
        flash[:warning] = "City #{city_params[:name]} not found" if city.nil?
        redirect_to root_url
    end

    private

    # Only allow a list of trusted parameters through.
    def city_params
        params.require(:city).permit(:name, :toggled)
    end

end
