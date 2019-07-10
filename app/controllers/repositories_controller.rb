class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = 'Iv1.ae3f37231dc6429a'
    client_secret = '7080461007c2774dfba7e8303d0aab8db44dec7c'

    @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
    end

    body = JSON.parse(@resp.body)
    @attributes = body["items"]
    render 'search'
  end
end
