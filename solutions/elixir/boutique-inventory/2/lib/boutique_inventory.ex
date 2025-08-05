defmodule BoutiqueInventory do

  def sort_by_price(inventory) do
    inventory
    |> Enum.sort_by(&(&1.price), :asc)
  end

  defp get_only_nil(val), do: val.price == nil

  def with_missing_price(inventory) do
    inventory
    |> Enum.filter(&get_only_nil/1)
  end

  def update_names(inventory, old_word, new_word) do
    inventory
    |> Enum.map(fn val ->
      Map.merge(val, %{name: String.replace(val.name, old_word, new_word)})
    end)
  end

  def increase_quantity(item, count) do
    mapper = fn {k, v} ->
      %{k => v + count}
    end

    increased_item =
      item.quantity_by_size
      |> Enum.flat_map(mapper)
      |> Enum.into(%{})

    Map.merge(item, %{quantity_by_size: increased_item})
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_k, v}, acc -> acc + v end)
  end
end
