class BookingInfosController < ApplicationController
  before_action :set_booking_info, only: [:show, :edit, :update, :destroy]

  # GET /booking_infos
  # GET /booking_infos.json
  def index
    @booking_infos = BookingInfo.all
  end

  # GET /booking_infos/1
  # GET /booking_infos/1.json
  def show
  end

  # GET /booking_infos/new
  def new
    @booking_info = BookingInfo.new
  end

  # GET /booking_infos/1/edit
  def edit
  end

  # POST /booking_infos
  # POST /booking_infos.json
  def create
    @booking_info = BookingInfo.new(booking_info_params)

    respond_to do |format|
      if @booking_info.save
        ticket = Ticket.where(ticket_type: params['booking_info']['Ticket_Type']).first
        if ticket
          avail_ticket = ticket.available_seats - params['booking_info']['No_Of_Tickets'].to_i
          res_ticket = ticket.reserved_seats + params['booking_info']['No_Of_Tickets'].to_i
          ticket.update(available_seats: avail_ticket, reserved_seats: res_ticket)
          ticket.save
        end
        format.html { redirect_to @booking_info, notice: 'Booking info was successfully created.' }
        format.json { render :show, status: :created, location: @booking_info }
      else
        format.html { render :new }
        format.json { render json: @booking_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_infos/1
  # PATCH/PUT /booking_infos/1.json
  def update
    respond_to do |format|
      if @booking_info.update(booking_info_params)
        format.html { redirect_to @booking_info, notice: 'Booking info was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_info }
      else
        format.html { render :edit }
        format.json { render json: @booking_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_infos/1
  # DELETE /booking_infos/1.json
  def destroy
    @booking_info.destroy
    respond_to do |format|
      format.html { redirect_to booking_infos_url, notice: 'Booking info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_info
      @booking_info = BookingInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_info_params
      params.require(:booking_info).permit(:User_Name, :email, :Ticket_Type, :No_Of_Tickets, :Advance)
    end
end
