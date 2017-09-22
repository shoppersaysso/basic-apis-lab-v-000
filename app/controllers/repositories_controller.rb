class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
     req.params['client_id'] = ENV["client_id"]
     req.params['client_secret'] = ENV["client_secret"]
     req.params['name'] = params[:name]
     req.params['repository'] = params[:url]
     req.params['description'] = params[:description]
   end
   render 'search'
  end
end
