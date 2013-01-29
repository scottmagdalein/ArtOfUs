require 'rubygems'
require 'sinatra'
require 'haml'
require 'pony'

set :haml, :format => :html5

get '/' do
  haml :index
end

post '/finish' do
	@one = params["one"]
	@two = params["two"]
	@three = params["three"]
	@four = params["four"]
	@five = params["five"]
	@six = params["six"]
	@seven = params["seven"]
	@eight = params["eight"]
	@nine = params["nine"]
	@ten = params{"ten"}
	@eleven = params["eleven"]
	@twelve = params["twelve"]
	@email = params["email"]
	@spouse_email = params["spouse_email"]

	options = {
		:to => "#{@email}",
		:cc => "#{@spouse_email}",
		:from => "no-reply@herokuapp.com",
		:subject => "You finished Redefining Love at ArtOfUs",
		# :body => "This is plain text.",
		:html_body => (haml :template),
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
