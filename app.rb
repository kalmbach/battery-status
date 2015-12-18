require "syro"
require "json"
require "./decks/frontend"
require "./lib/battery"
require "./lib/machine"

Web = Syro.new(Frontend) {
  root {
    render("index", title: "Battery Status")
  }

  on("status") {
    status = Battery.status.merge(Machine.hostname)

    res.headers["Content-Type"] = "application/json"
    res.write JSON.generate(status)
  }
}

App = Rack::Builder.new {
  use Rack::MethodOverride
  use Rack::Static, urls: %w[/css /js], root: "./public"
  run(Web)
}
