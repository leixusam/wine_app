module WinesHelper
	def full_name_for(wine)
		if wine.name.empty?
			"#{wine.varietal}, #{wine.winery} #{wine.region} #{wine.vintage}"
		else
			"#{wine.name}, #{wine.winery} #{wine.region} #{wine.vintage}"
		end
	end
end
