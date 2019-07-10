class ParseBookingDate < Patterns::Service
  def initialize(params)
    @params = params
  end

  def call
    booking = params[:booking]
    start = DateTime.new(booking['date_from(1i)'].to_i,
                         booking['date_from(2i)'].to_i,
                         booking['date_from(3i)'].to_i)
    deadline = DateTime.new(booking['date_to(1i)'].to_i,
                            booking['date_to(2i)'].to_i,
                            booking['date_to(3i)'].to_i)
    updated_params = {}
    
    updated_params[:company_id] = booking[:company_id]
    updated_params[:building_location_id] = booking[:building_location_id]
    updated_params[:date_from] = start
    updated_params[:date_to] = deadline

    updated_params
  end

  private

  attr_reader :params
end
