Rails.application.config.hosts = [
  IPAddr.new("127.0.0.1"), # All IPv4 addresses.
  IPAddr.new("::/1"),      # All IPv6 addresses.
  "localhost",             # The localhost reserved domain.
  "meusite.local",
  "v1.meusite.local",
  "v2.meusite.local"
]