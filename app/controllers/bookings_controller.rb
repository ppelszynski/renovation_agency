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
    @form ||= if params[:booking][:date_from] && params[:booking][:date_to]
                BookingForm.new(Booking.new, params)
              elsif
                updated_params = ParseBookingDate.call(params).result
                BookingForm.new(Booking.new, new_params)
              else
                BookingForm.new(Booking.new)
              end
  end
end
