class ArticlesController < ApplicationController

	#GET /articles
	def index
		# Todos los registros SELECT * FROM articles
		@articles = Article.all
	end

	#GET /articles/:id
	def show
		#Encontrar registro por ID
		@articles = Article.find(params[:id])
		#Where
		#Article.where("body LIKE ?", "%hola%")
	end
	
	#GET /articles/new
	def new
		@articles = Article.new
	end

	def edit
		@articles = Article.find(params[:id])
	end
	
	#POST /articles
	def create
		#INSERT INTO
		@articles = Article.new(article_params)

		if @articles.save
		redirect_to @articles
		else
		render :new
		end
	end

	#DELETE /articles/:id
	def destroy
		#DELETE FROM articles
		@articles = Article.find(params[:id])
		@articles.destroy #Destroy elimina el obketo de la BD
		redirect_to articles_path
	end

	#PUT /articles/:id
	def update
		#UPDATE
		@articles = Article.find(params[:id])
		if @articles.update(article_params)
			redirect_to @articles
		else
			render :edit
		end
	end

	private
	def article_params
		params.require(:article).permit(:title, :body)
	end
end