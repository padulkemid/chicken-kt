defmodule Allergies do
  import Bitwise

  @allergens %{
    1 => "eggs",
    2 => "peanuts",
    4 => "shellfish",
    8 => "strawberries",
    16 => "tomatoes",
    32 => "chocolate",
    64 => "pollen",
    128 => "cats"
  }

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t()]
  def list(flags) do
    filter_opt = fn {bits, _} ->
      (bits ||| flags) == flags
    end

    mapper_opt = fn {_, val} ->
      val
    end

    @allergens
    |> Enum.filter(filter_opt)
    |> Enum.map(mapper_opt)
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t()) :: boolean
  def allergic_to?(flags, item) do
    list(flags)
    |> Enum.any?(fn val -> item == val end)
  end
end
