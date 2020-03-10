class PortfoliosController < ApplicationController
	before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  layout "portfolio"
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, 
    :update, :edit, :sort]},
    site_admin: :all

	def index
		@portfolio_items = Portfolio.by_position		
	end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    head :ok, content_type: "text/html"
  end

  def angular
    @angular_portfolio_items = Portfolio.angular  
  end

	def show
	end

	def new
		@portfolio_item = Portfolio.new
	end

	def create
		@portfolio_item = Portfolio.new(portfolio_params)

    	respond_to do |format|
	    	if @portfolio_item.save
	        	format.html { redirect_to portfolio_path, notice: 'Portfolio was successfully created.' }
	        	format.json { render :show, status: :created, location: @portfolio_item }
	    	else
	        	format.html { render :new }
	        	format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
	    	end
    	end
	end

	def edit
	end

	def update
    	respond_to do |format|
      		if @portfolio_item.update(portfolio_params)
        		format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
        		format.json { render :show, status: :ok, location: @portfolio_item }
      		else
        		format.html { render :edit }
        		format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      		end
    	end
  	end

  	def destroy
    	@portfolio_item.destroy
    	respond_to do |format|
      		format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
      		format.json { head :no_content }
    	end
  	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio_item = Portfolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image,
        technologies_attributes: [:id, :name, :_destroy])
    end

end
