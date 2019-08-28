class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @response = Faraday.get 'https://api.github.com/search/repositories' do |req| 
      req.params['client_id'] = '3fe37247af8c48e66620'
      req.params['client_secret'] = '72ea4454bb436f4eb8fed69e9faf61261ea3f789'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@response.body)
    @repositories = body["items"]
    render 'search'
  end
end
