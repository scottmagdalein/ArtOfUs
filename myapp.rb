require 'rubygems'
require 'sinatra'
require 'haml'
require 'pony'

get '/' do
  haml :index
end

post '/template' do
	@one = params["one"]
	@three = params["three"]

	options = {
		:to => "scottmagdalein@gmail.com",
		:from => "no-reply@herokuapp.com",
		:subject => "You finished Love is Leading at ArtOfUs",
		:body => "This is plain text.",
		# :html_body => (haml :template),
		:via => :smtp,
		:via_options => {
			:address => 'smtp.mandrillapp.com',
			:port => '587',
			:enable_starttls_auto => true,
			:user_name => 'scottmagdalein@gmail.com',
			:password => '6xNf32J0tIlqgqW_epr3Kg',
			:authentication => :plain,
			:domain => "herokuapp.com"
		}
	}

	Pony.mail(options)

	haml :template
end
