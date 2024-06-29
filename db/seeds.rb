# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require_relative '../app/models/databreach.rb'
require 'csv'

# For data_breaches.csv
# Convert CSV file column `displayed_records` to int
def convert_to_numbers(string)
  case string
  when /unknown/i
    nil
    # $ Asserts the position at the end of a line
    # i: Makes the regular expression case-insensitive
    # Looks for a K at the end of the string
  when /K$/i
    (string.gsub("K", "").to_f * 1_000).to_i  # multiply by 1,000 for thousands
  when /m$/i
    (string.gsub("m", "").to_f * 1_000_000).to_i  # multiply by 1,000,000 for millions
  when /bn$/i
    (string.gsub("bn", "").to_f * 1_000_000_000).to_i  # multiply by 1,000,000,000 for billions
  when /one billion/i
    1_000_000_000
  else
    nil
  end
end

# Read CSV data into a variable
csv_text = File.read(Rails.root.join('lib', 'seeds', 'data_breaches.csv'))
# Parse CSV
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

# Converts each row of the csv into a hash
# Headers will be converted as keys
csv.each do |row|
  # puts row.to_hash
  # t = Databreach.create(row.to_hash)
  t = Databreach.new
  t.organisation = row['organisation']
  t.alternative_name = row['alternative_name']
  t.records_lost = row['records_lost'].gsub(",", "")
  t.year = row['year']
  t.date = row['date']
  t.story = row['story']
  t.sector = row['sector']
  t.method = row['method']
  t.has_interesting_story = row['has_interesting_story']
  t.data_sensitivity = row['data_sensitivity']
  t.displayed_records = convert_to_numbers(row['displayed_records'])
  t.source_name = row['source_name']
  t.first_source_link = row['first_source_link']
  t.second_source_link = row['second_source_link']
  t.data_id = row['data_id']
  t.save
end
puts "...Saved!"



# data = [
#   "unknown", "unknown", "unknown", "unknown", "unknown", "unknown",
#   "9m", "94m", "92m", "900K", "80m", "76m", "73m", "711m", "70m", "700m",
#   "68.7m", "600K", "6.9m", "6.9m", "6.5m", "5m", "5m", "57m", "560m",
#   "533m", "50m", "500m", "500K", "5.2m", "470K", "43m", "420m", "412m",
#   "4.9m", "4.5m", "4.1m", "38m", "38m", "383m", "380m", "340m", "330m",
#   "30m", "300K", "3.7m", "287K", "275m", "26m", "250m", "22m", "220m",
#   "202m", "200m", "200m", "200m", "1bn", "19m", "198m", "188K", "164m",
#   "162m", "160m", "150m", "150K", "145m", "143m", "139m", "130m", "120m",
#   "117m", "115m", "100m", "100m", "100m", "100m", "100m", "100K", "10.6m",
#   "1.3bn", "1.1bn", "one billion"
# ]

# data.each do |line|
#   puts convert_to_numbers(line)
# end