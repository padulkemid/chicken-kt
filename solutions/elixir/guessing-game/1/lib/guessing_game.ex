defmodule GuessingGame do
  def compare(_), do: "Make a guess"
  def compare(_, g) when is_atom(g), do: "Make a guess"
  def compare(sn, g) when sn == g + 1 or sn == g - 1, do: "So close"
  def compare(sn, g) when sn < g, do: "Too high"
  def compare(sn, g) when sn > g, do: "Too low"
  def compare(sn, g) when sn == g, do: "Correct" 
end
