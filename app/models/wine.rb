class Wine < ActiveRecord::Base
  attr_accessible :winery, :varietal, :name, :vintage, :region, :ratings_attributes
  has_many :ratings, dependent: :destroy
  accepts_nested_attributes_for :ratings

  validates :winery, 			presence: true
  validates :varietal, 		presence: true
  validates :vintage, 		presence: true
  validates :region, 			presence: true
  validates_uniqueness_of :winery, :scope => [:varietal, :name, :vintage, :region]

  VINTAGES = ["NV", 2013, 2012, 2011, 2010, 2009, 2008, 2007, 2006, 2005, 2004,
  						2003, 2002, 2001, 2000, 1999, 1998, 1997, 1996, 1995, 1994, 1993,
  					  1992, 1991, 1990, 1989, 1988, 1987, 1986, 1985, 1984, 1983, 1982,
  					  1981, 1980, "Prior to 1980"]
  
  def full_name
    if name.empty?
      "#{varietal}, #{winery} #{region} #{vintage}"
    else
      "#{name}, #{winery} #{region} #{vintage}"
    end
  end

end
