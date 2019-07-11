class TodayBookedCompaniesQuery < Patterns::Query
  queries Company

  private

  def query
    company_ids = Booking.order('created_at DESC').where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).limit(5).pluck(:company_id)
    Company.where(id: company_ids)
  end
end
