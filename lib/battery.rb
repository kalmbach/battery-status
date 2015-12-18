module Battery
  CMD = 'upower -i /org/freedesktop/UPower/devices/battery_BAT0'

  def self.status
    parse(`#{CMD}`)
  rescue => e
    { error: e.to_s }
  end

  private

  def self.parse(status)
    lines = status.split("\n")
    parts = lines.map{ |line| line.split(":").map(&:strip) }
    values = parts.select{ |part| part.count == 2 }

    Hash[values]
  end
end
