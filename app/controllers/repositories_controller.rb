class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
     req.params['client_id'] = ENV['client_id']
     req.params['client_secret'] = ENV['client_secret']
     req.params['v'] = '20160201'
     req.params['near'] = params[:zipcode]
     req.params['query'] = 'coffee shop'
   end
   render 'search'
  end
end
