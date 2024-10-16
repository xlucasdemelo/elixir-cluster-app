defmodule MyClusterApp.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Cluster.Supervisor, [Application.get_env(:libcluster, :topologies), [name: MyClusterApp.ClusterSupervisor]]}
    ]

    Task.start(fn -> ClusterMessenger.start_messenger() end)

    opts = [strategy: :one_for_one, name: MyClusterApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
