class Article < ActiveRecord::Base
	#La tabla => articles
	#Campos => article.title() => 'título del artículo'
	#Escribir métodos
	validates :title, presence: true, uniqueness: true
	validates :body, presence: true, length: {minimum: 20}
end
