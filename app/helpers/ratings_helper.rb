module RatingsHelper
	def conver_to_stars(overall_rating)
		star_string = ""
		overall_rating.times {star_string = star_string + "<i class=\"icon-star\"></i>"}
		star_string.html_safe
	end
end
