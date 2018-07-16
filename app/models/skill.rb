class Skill < ApplicationRecord
	include Placeholder

	validates_presence_of :title, :percent_utilized

	after_initialize :set_defaults

	# creation de valeur par défaut pour :main_image et :thumb_image
	def set_defaults
		# On utilise "self" pour cette instance spécifique de Portfolio.create!()
		# L'opérateur ||= ne "set" une valeur que si la valeur initiale est nulle
		# ou existe déjà
		self.badge ||= Placeholder.image_generator(height:'250', width:'250')
	end
end
