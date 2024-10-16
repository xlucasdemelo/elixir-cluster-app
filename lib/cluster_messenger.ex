defmodule ClusterMessenger do
  def send_message_to_all_nodes(message) do
    Node.list()
    |> Enum.each(fn node ->
      send({:messenger, node}, {:message, self(), message})
    end)
  end

  def start_messenger() do
    IO.inspect("Agora sim piroca")
    Node.list()
    Process.register(self(), :messenger)
    receive_messages()
  end

  defp receive_messages do
    receive do
      {:message, from_pid, message} ->
        IO.puts("Received '#{message}' from #{inspect(from_pid)} on #{node()}")
        receive_messages()
    end
  end
end
