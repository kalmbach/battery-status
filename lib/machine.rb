module Machine
  def self.hostname
    { hostname: `hostname`.gsub("\n", '') }
  rescue => e
    { error: e.to_s }
  end
end
