class PortfoliosController < ApplicationController
	def index
		@portfolio_item = Portfolio.all
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
		@portfolio_item = Portfolio.find(params[:id])
	end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
  	@portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

end
