defmodule KitchenCalculator do
  def get_volume(volume_pair), do: elem(volume_pair, 1)

  def to_milliliter({:cup, v}), do: {:milliliter, v * 240}
  def to_milliliter({:fluid_ounce, v}), do: {:milliliter, v * 30}
  def to_milliliter({:teaspoon, v}), do: {:milliliter, v * 5}
  def to_milliliter({:tablespoon, v}), do: {:milliliter, v * 15}
  def to_milliliter({:milliliter, v}), do: {:milliliter, v}

  def from_milliliter({:milliliter, v}, :cup), do: {:cup, v / 240}
  def from_milliliter({:milliliter, v}, :fluid_ounce), do: {:fluid_ounce, v / 30}
  def from_milliliter({:milliliter, v}, :teaspoon), do: {:teaspoon, v / 5}
  def from_milliliter({:milliliter, v}, :tablespoon), do: {:tablespoon, v / 15}
  def from_milliliter(volume_pair, :milliliter), do: volume_pair

  def convert(volume_pair, unit), do: to_milliliter(volume_pair) |> from_milliliter(unit)
end
