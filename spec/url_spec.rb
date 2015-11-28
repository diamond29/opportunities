require_relative 'spec_helper'
require 'json'

PHILLY = JSON.parse(IO.read('philadelphia.json'))
PHILLY.each do |company_hash|
  describe "#{company_hash['company']}", :type => :feature do
    include_examples :jobs_at_url, company_hash
  end
end

