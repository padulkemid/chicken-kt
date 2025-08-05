defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    numbers
    |> Tuple.to_list()
    |> Enum.with_index()
    |> Enum.sort_by(fn e -> elem(e, 0) end)
    |> get_data(key)
  end

  defp get_data([], _), do: :not_found

  defp get_data(list, key) when is_list(list) do
    middle = div(length(list), 2)
    {left, [{val, index} | right]} = Enum.split(list, middle)

    cond do
      key === val -> {:ok, index}
      key < val -> get_data(left, key)
      key > val -> get_data(right, key)
    end
  end
end
