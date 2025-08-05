defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    [h | t] = String.split(path, ".")

    get_value(data[h], t)
  end

  defp get_value(data, []), do: data

  defp get_value(data, [h | t]) do
    get_value(data[h], t)
  end

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
