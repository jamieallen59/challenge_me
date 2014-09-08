require 'rails_helper'
 
describe 'Jasmine suite', :js do
  def run_jasmine_tests
    visit '/runner.html'
    Timeout.timeout(10) do
      while page.has_css?('.runningAlert')
        sleep 0.25
      end
    end
  end
 
  it "passes" do
    run_jasmine_tests
 
    if page.has_css?(".menu .bar .failure-list")
      messages = []
      all('.spec-detail .failed .description').each_with_index do |spec, index|
        messages << "#{index + 1}. #{spec.text}"
      end
      messages.unshift("Jasmine suite failed with #{messages.size} failures")
      fail messages.join("\n")
    else
      expect(page).to have_css('.passed')
    end
  end
end