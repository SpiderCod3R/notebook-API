require 'rack'

app = Proc.new do |env|
  ['200', { 'Content-Type' => 'text/html'}, ['A Test rack app']]
end

Rack::Handler::WEBrick.run(app, Port: 3001, Host: '0.0.0.0')