require 'syro'
require 'mote'

class Frontend < Syro::Deck
  include Mote::Helpers

  def view(template)
    sprintf("views/%s.mote", template)
  end

  def render(template, options = {})
    res.write mote(view(template), options)
  end
end
