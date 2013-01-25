require 'rubygems'
require 'sinatra'
require 'haml'
require 'pony'


get '/' do
  haml :index
end

get '/section1' do
	email = params[:email]
	email_spouse = params[:email_spouse]
	name = params[:name]
	
	results = {
		:to => "#{email}",
		:from => "#{email}",
		:subject => "#{name} finished Love is Leading at ArtOfUs",
		:body => "This is plain text.",
		:html_body => (haml :template)
	}

	Pony.mail(results)
end