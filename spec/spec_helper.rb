require 'capybara/rspec'
require 'pry'

Capybara.default_driver = :selenium

shared_examples :jobs_at_url do |company_hash|
  if company_hash['url']
    context "at #{company_hash['url']}" do
      it "has jobs described" do
        Capybara.visit(company_hash['url'])

        company_hash['positions'].each do |pos|
          expect(Capybara.page).to have_content(pos)
        end
      end
    end
  end
end
