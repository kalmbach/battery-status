require 'syro'
require 'json'
require './lib/battery'

Web = Syro.new {
  root {
    res.write("hola syro")
  }

  on("status") {
    res.headers["Content-Type"] = "application/json"
    res.write(
      JSON.generate(Battery.status)
    )
  }
}

App = Rack::Builder.new {
  use Rack::MethodOverride
  use Rack::Static, urls: %w[/css /fonts /img], root: "./public"
  run(Web)
}
