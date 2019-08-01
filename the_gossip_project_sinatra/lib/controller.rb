
require 'gossip'

class ApplicationController < Sinatra::Base

	get '/' do
		erb :index, locals: {gossips: Gossip.all}
	end

	get '/gossips/new/' do
		erb :new_gossip
	end

	post '/gossips/new/' do
		Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save
	puts "creation de gossip"
	redirect '/'
	end

	get '/gossips/:id/' do
		erb :show, locals: {i: params['id'], gossips: Gossip.find(params['id'])}
		
	end
end