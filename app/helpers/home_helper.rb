module HomeHelper
  def today_companies
    companies = []
    bookings = []

    Booking.order('created_at DESC').each do |booking|
      if booking.created_at.to_date == DateTime.now.to_date
        bookings.push booking
      end
    end

    bookings.each do |booking|
      companies.push(booking.company) unless companies.include?(booking.company)
    end

    companies.first(5)
  end

  def this_month_bookings_count
    num = 0

    Booking.all.each do |booking|
      if booking.created_at.month == DateTime.now.month
        num += 1
      end
    end

    num
  end

  def bookings_starting_next_month
    num = 0

    Booking.all.each do |booking|
      if booking.date_from.month == DateTime.now.month + 1
        num += 1
      end
    end

    num
 end
end
