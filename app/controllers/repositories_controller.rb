class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'YOUR CLIENT ID'
      req.params['client_secret'] = 'YOUR CLIENT SECRET'
      req.params['q'] = params[:query]
    end
    hash = JSON.parse(@resp.body)

    if @resp.success?
      @user = hash["items"] #1st before adding the if statment
    else
      @error = hash["message"]
    end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again"
    end
      render 'search'
  end
end
