class Portfolio < ApplicationRecord
	include Placeholder

	validates_presence_of :title, :body, :main_image, :thumb_image

	def self.angular
		where(subtitle:"Angular")
	end

	scope :ruby_on_rails_portfolio_items, -> {where(subtitle: "Ruby on rails")}


	#Il y a 2 façons de créer des valeurs par défaut

	# 1) depuis le fichier de migration avec ajout d'une valeur par défaut
	# (voir add_post_status_to_blogs)

	# 2) Création d'un callback et d'un méthode set_defaults (voir ci-dessous)

	#Création d'un callback
	after_initialize :set_defaults

	# creation de valeur par défaut pour :main_image et :thumb_image
	def set_defaults
		# On utilise "self" pour cette instance spécifique de Portfolio.create!()
		# L'opérateur ||= ne "set" une valeur que si la valeur initiale est nulle
		# ou existe déjà
		self.main_image ||= Placeholder.image_generator(height:'600', width:'400')
		self.thumb_image ||= "http://via.placeholder.com/350x200"
	end


	# Le code ci-dessous est équivalent au code ci-dessus pour self.main_image
	# if self.main_image == nil
	# 	self.main_image = "http://via.placeholder.com/600x400"
	# end
end