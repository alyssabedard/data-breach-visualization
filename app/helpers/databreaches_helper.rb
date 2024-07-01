module DatabreachesHelper
  def format_date(date)
    date.strftime('%B %Y') if date.respond_to? :strftime
  end
  def format_records_lost(records_lost)
    number_with_delimiter(records_lost)
  end
  def format_displayed_records(displayed_records)
    number_with_delimiter(displayed_records)
  end
  def format_data_sensitivity(data_sensitivity)
    case data_sensitivity
    when 1
      "(1) Just email address/Online information"
    when 2
      "(2) SSN/Personal details"
    when 3
      "(3) 3 Credit card information"
    when 4
      "(4) Health & other personal records"
    when 5
      "(5) Full details"
    end
  end

end
