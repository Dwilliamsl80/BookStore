class InvoicesController < ApplicationController
  before_action :authenticate_user!

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = current_user.invoices
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @order = current_order
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice =Invoice.new
    @invoice.user_id = current_user.id
    @invoice.order_id = current_order.id
    @invoice.save
    session.delete(:order_id)
    redirect_to "/books/"
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.fetch(:invoice, {})
    end
end
