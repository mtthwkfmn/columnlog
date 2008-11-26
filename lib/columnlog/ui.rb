require File.join(File.dirname(__FILE__), '../columnlog.rb')
require File.join(File.dirname(__FILE__), '../../sinatra/lib/sinatra.rb')

template :layout do
  <<-HTML
  <html>
    <head>
      <meta http-equiv="Content-type" content="text/html; charset=utf-8">
      <title>Columnlog</title>
      <style type="text/css" media="screen">
        body { font: 75% "Helvetica", arial, Verdana, sans-serif; background: #FFB03B; }
        h1 { margin: 0; color: #8E2800; }
        h2 { margin-bottom: 0;}
        a { color: #468966; }
        #page { margin: 1em auto; width: 800px; border: 0.75em solid #B64926; background: white; padding: 2em; }
        .post { border-bottom: 0.4em double #FFB03B; padding-bottom: 1em;}
        .post .subtitle { padding-bottom: 1em; font-size: 83.333%; display: block;}
        #header, #footer { width: 850px; margin: 0 auto}
        #header h3 { font-size: 220%; margin: 0.5em 0 0 0; font-family: "Georgia";}
        #header h3 a { color: #FFF0A5; text-decoration: none; text-transform: uppercase; letter-spacing: 0.3em; text-shadow: #B64926 0.04em 0.04em;}
      </style>
    </head>
    <body>
      <div id = "header"><h3><a href="/">Keepin it Columnar</a></h3></div>
      <div id = "page">
        <%=yield%>
      </div>
      <div id = "footer">by <a href="http://www.github.com/mrb">mrb</a> and <a href="http://www.github.com/quirkey">quirkey</a></div>
    </body>
  </html>
  HTML
end

get '/' do
  erb :index
end

get '/new' do
  erb :new
end

post '/new' do
  Columnlog::App::Twitters.new.post(params[:tweet])
  redirect '/'
end

get '/about' do
  "I'm running on Version " + Sinatra::VERSION
end