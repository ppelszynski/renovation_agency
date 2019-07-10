class BookingsController < ApplicationController
  before_action :set_form, only: %i[new create]

  def new; end

  def create
    if @form.save
      flash[:success] = 'Booking created.'
      redirect_to bookings_path
    else
      render :new
    end
  end

  def index
    @bookings = Booking.all
  end

  private

  def set_form
    @form ||= if params[:booking]
                updated_params = ParseBookingDate.call(params).result
                BookingForm.new(Booking.new, updated_params)
              else
                BookingForm.new(Booking.new)
              end
  end
end
