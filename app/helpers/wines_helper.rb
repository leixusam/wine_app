module WinesHelper
	def full_name_for(wine)
		if wine.name.empty?
			"#{wine.winery} #{wine.varietal} #{wine.vintage}, #{wine.region}"
		else
			"#{wine.winery} #{wine.name} (#{wine.varietal}) #{wine.vintage}, #{wine.region}"
		end
	end
end
