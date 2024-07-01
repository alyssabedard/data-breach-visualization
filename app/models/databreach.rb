class Databreach < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  # attr_accessor :records_lost, :displayed_records, :data_sensitivity
  # attr_writer  :records_lost, :data_sensitivity
  def all_attributes
    self.attributes
  end

  def self.find_by_organisation(organisation)
    @connection = ActiveRecord::Base.connection
    results = @connection.exec_query("SELECT * FROM databreaches WHERE organisation = '#{organisation}' LIMIT 10;")
    return results
  end



end

