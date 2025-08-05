defmodule TakeANumber do
  def start() do
    spawn(fn -> receiver(0) end)
  end

  defp receiver(state) do
    receive do
      {:report_state, pid} ->
        send(pid, state)
        receiver(state)

      {:take_a_number, pid} ->
        new_state = state + 1
        send(pid, new_state)
        receiver(new_state)

      :stop ->
        nil

      _ ->
        receiver(state)
    end
  end
end
