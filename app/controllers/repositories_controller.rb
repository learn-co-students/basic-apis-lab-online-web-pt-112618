class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	response = Faraday.get 'https://api.github.com/search/repositories' do |r|
  		r.params["client_id"] = ''
  		r.params["client_secret"] = ''
  		r.params["q"] = params[:query]
	end

  	body = JSON.parse(response.body)
    @results = body["items"]
	render :search
  end

end
