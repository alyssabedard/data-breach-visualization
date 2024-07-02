class Databreach < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  # attr_accessor :records_lost, :displayed_records, :data_sensitivity
  # attr_writer  :records_lost, :data_sensitivity
  def all_attributes
    self.attributes
  end

  def self.fetch_all_breaches
    @data = self.select(:data_sensitivity,:records_lost, :organisation)
    # data = [['organisation','records_lost', 'data_sensitivity', ]]  # Header row

    # @data.each do |point|
    #   data << [point.organisation, point.records_lost, point.data_sensitivity]
    # end
    #
    # data
  end

  def self.group_by_year
    self.group(:year).count
  end


  # @organisation = params[:organisation]
  def find_org(organisation)
    # organisation = params[:organisation]
    @connection = ActiveRecord::Base.connection
    results = @connection.exec_query("SELECT * FROM databreaches WHERE organisation = '#{organisation}' LIMIT 10;")
  end

  def self.search(search)
    if search
      org_name = Databreach.find_by(organisation: search)
      if org_name
        org_name
      else
        @organisations = Databreach.all
      end
    else
      @organisations = Databreach.all
    end
  end





end

