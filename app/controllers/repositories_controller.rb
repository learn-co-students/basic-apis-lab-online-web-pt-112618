class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @response = Faraday.get 'https://api.github.com/search/repositories' do |req| 
      req.params['client_id'] = ''
      req.params['client_secret'] = ''
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@response.body)
    @repositories = body["items"]
    render 'search'
  end
end
