defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) do
    a_side = a + b >= c
    b_side = b + c >= a
    c_side = a + c >= b

    cond do
      a <= 0 or b <= 0 or c <= 0 ->
        {:error, "all side lengths must be positive"}

      a_side and b_side and c_side ->
        {:ok, check_sides(a, b, c)}

      true ->
        {:error, "side lengths violate triangle inequality"}
    end
  end

  defp check_sides(a, b, c) do
    cond do
      a == b and b == c -> :equilateral
      a == b or a == c or b == c -> :isosceles
      true -> :scalene
    end
  end
end
