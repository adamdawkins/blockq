class QuotesController < ApplicationController
  respond_to :html
  before_filter :login_required, :only => [:new, :create]
  def index
    @quotes = Quote.order("created_at DESC")
    respond_with(@quotes)
  end

  def show
    @quote = Quote.find(params[:id])
    respond_with(@quote)
  end

  def new
    @quote = current_user.quotes.build
    @quote.text = params[:t]
    @quote.author = params[:a]
    @quote.source = params[:s]
    respond_with(@quote)
  end

  def edit
    @quote = Quote.find(params[:id])
  end
  
  def create
    @quote = current_user.quotes.build(params[:quote])
    if @quote.save
      flash[:notice] = 'Quote was successfully added.'
    end
    respond_with(@quote)
  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update_attributes(params[:quote])
      flash[:notice] = 'Quote was successfully updated.'
    end
    respond_with(@quote)
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    respond_with(@quote)
  end
end
