import Config

config :libcluster,
  topologies: [
    my_cluster: [
      strategy: Cluster.Strategy.Gossip,
      config: [
        port: 45892,
        if_addr: "0.0.0.0",           # Listen on all interfaces
        multicast_addr: "230.1.1.251", # Multicast address for Gossip
        multicast_ttl: 1,
        secret: "my_secret_cookie"     # Shared cookie for node authentication
      ]
    ]
  ]
