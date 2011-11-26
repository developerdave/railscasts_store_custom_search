require 'spec_helper'

describe "routes for searches" do
  it "routes /searches to the searches controller" do
    get('/searches').
        should route_to(:action => "index", :controller => "searches")
  end

  it "routes /searches/new to the searches controllers new action" do
    get('/searches/new').
        should route_to(:action => "new", :controller => "searches")
  end
end