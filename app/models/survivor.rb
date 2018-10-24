class Survivor < ApplicationRecord
	validates :name, :gender, :latitude, :longitude, :age, presence: true
	validates :age,:latitude, :longitude, numericality: true
	validates :gender, inclusion: {in: ["male", "female", "other"], message: "%{value} is not a valid gender"}


	scope :non_abducted, -> {where(abducted: true)}
	scope :abducted, -> {where(abducted: false)}
	scope :age, -> (age) {where(age: age)}
	scope :gender, -> (gender) {where(gender: gender)}
	scope :by_name, -> (name) {where(name: name)}
	scope :latitude, -> (latitude) {where(latitude: latitude)}
	scope :longitude, -> (longitude) {where(longitude: longitude)}

end
# 