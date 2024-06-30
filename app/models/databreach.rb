class Databreach < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  # attr_accessor :records_lost, :displayed_records, :data_sensitivity
  # attr_writer  :records_lost, :data_sensitivity

  # def initialize(attributes = {})
  #   super(attributes)
  #   @data_sensitivity = data_sensitivity
  #   @records_lost = records_lost_e(self[:records_lost])
  # end
  def all_attributes
    self.attributes
  end


  def date
    date.strftime('%B %Y') if date.respond_to? :strftime
  end


  def records_lost
    number_with_delimiter(self[:records_lost])
  end

  def displayed_records
    number_with_delimiter(self[:displayed_records])
  end
  def data_sensitivity
    case self[:data_sensitivity]
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

