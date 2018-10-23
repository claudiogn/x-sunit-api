class Survivor < ApplicationRecord
	validates :name, :gender, :latitude, :longitude, :age, presence: true
	validates :name, uniqueness: true
	validates :age,:latitude, :longitude, numericality: true
	validates :gender, inclusion: {in: ["male", "female", "other"], message: "%{value} is not a valid gender"}


	scope :non_abducted, -> {where(abducted: true)}
	scope :abducted, -> {where(abducted: false)}

end
# 