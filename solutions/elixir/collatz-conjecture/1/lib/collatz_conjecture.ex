defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(1), do: 0
  def calc(input), do: run_steps(input, 0)

  defp run_steps(1, steps), do: steps

  defp run_steps(input, steps) when is_integer(input) and input > 0 do
    check_input = rem(input, 2)

    cond do
      check_input === 0 -> run_steps(div(input, 2), steps + 1)
      true -> run_steps(input * 3 + 1, steps + 1)
    end
  end
end
