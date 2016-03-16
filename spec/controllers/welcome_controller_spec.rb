require 'support/controller_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #index action" do
    it_behaves_like "a successful GET action", :index do
    end
  end

  describe "GET #about" do
    it_behaves_like "a successful GET action", :about do
    end
  end

end
