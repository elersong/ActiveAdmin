class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  
  def index
        # this method (action) will render the index.html.erb view
        # which can be found in the /views/pages directory
        @pages = Page.all
  end

  def about
        # this method (action) will render the about.html.erb view
        # which can be found in the /views/pages directory
        @page = Page.where(slug: 'about').first
  end
    
  def show
  end
    
  def new
        @page = Page.new
  end
    
  def create
        @page = Page.new(page_params)
        @page.save
        redirect_to action: :show, id: @page.id
  end

  
  private # Use callbacks to share common setup or constraints between actions. 
  def set_page
    @page = Page.find(params[:id]) 
  end

  # Never trust parameters from the scary internet, only ➥allow the white list through.
  def page_params 
    params.require(:page).permit(:title, :slug, :content)
  end
  
end
