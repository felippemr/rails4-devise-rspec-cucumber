require 'spec_helper'

describe 'HomeController' do
  describe "GET índex'" do
    it "should be successful" do
      response.should be_success
    end
  end
end
