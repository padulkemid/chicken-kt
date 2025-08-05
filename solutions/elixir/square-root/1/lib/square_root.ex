defmodule SquareRoot do
  @moduledoc """
  SquareRoot with binary numeral system (base 2)
  only works with pos_integer
  """

  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    x = radicand
    c = 0

    init_digit = init_d(Bitwise.<<<(1, 30), radicand)

    sqrt(x, radicand, c, init_digit)
  end

  defp init_d(d, _) when d <= 0, do: 0

  defp init_d(d, radicand) do
    cond do
      d > radicand -> init_d(Bitwise.>>>(d, 2), radicand)
      true -> d
    end
  end

  defp sqrt(_, _, c, d) when d <= 0, do: c

  defp sqrt(x, radicand, c, d) do
    if x >= c + d do
      x2 = x - (c + d)
      c2 = Bitwise.>>>(c, 1) + d
      d2 = Bitwise.>>>(d, 2)

      sqrt(x2, radicand, c2, d2)
    else
      sqrt(x, radicand, Bitwise.>>>(c, 1), Bitwise.>>>(d, 2))
    end
  end
end
