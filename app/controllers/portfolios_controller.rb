class PortfoliosController < ApplicationController
	def index
		@portfolio_item = Portfolio.all
	end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

	def new
		@portfolio_item = Portfolio.new
	end

	def create
		@portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
		respond_to do |format|
      		if @portfolio_item.save
        		format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully created.' }
        		format.json { render :show, status: :created, location: @portfolio_item }
      		else
        		format.html { render :new }
        		format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      		end
    	end
	end

	def edit
		#Va chercher tout les item portfolio où le Id correspond au paramètre ID reçu via GET
		@portfolio_item = Portfolio.find(params[:id])
	end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
  	#Va chercher tout les item portfolio où le Id correspond au paramètre ID reçu via GET
  	@portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  	#Va chercher tout les item portfolio où le Id correspond au paramètre ID reçu via GET
  	@portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
  	#Va chercher tout les item portfolio où le Id correspond au paramètre ID reçu via GET
  	@portfolio_item = Portfolio.find(params[:id])

  	#Le portfolio item est détruit
  	@portfolio_item.destroy

  	#Redirection après destruction
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'This item was successfully destroyed.' }
    end
  end

end
