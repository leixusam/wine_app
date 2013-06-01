class Rating < ActiveRecord::Base

  attr_accessible :wine_id, :user_id, :overall_rating, :smell1, :smell2, :smell3, :taste1, :taste2, :taste3
  belongs_to :wine

  #validates :wine_id, presence: true
  validates :user_id, presence: true
  validates :overall_rating, presence: true
  validates :smell1, presence: true
  validates :smell2, presence: true
  validates :smell3, presence: true
  validates :taste1, presence: true
  validates :taste2, presence: true
  validates :taste3, presence: true


end
