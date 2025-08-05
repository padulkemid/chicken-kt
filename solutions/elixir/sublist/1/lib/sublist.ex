defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  @spec compare(a :: list, b :: list) :: :equal | :superlist | :sublist | :unequal
  def compare(a, b) when a == b, do: :equal
  def compare([], _b), do: :sublist
  def compare(_a, []), do: :superlist

  def compare(a, b) when a !== b do
    {stat_check, diff, res} = check_list(a, b, [])

    IO.inspect(%{
      eq?: stat_check,
      diff: diff,
      res: res
    })

    stat_check
  end

  def check_list([], [], diff), do: {:unequal, diff, nil}
  def check_list([], b, diff), do: {:sublist, diff, b}
  def check_list(a, [], diff), do: {:superlist, diff, a}

  def check_list(a, b, c) do
    [a_head | a_tail ] = a
    [b_head | b_tail ] = b

    IO.inspect(%{
      phase: c,
      a_head: a_head,
      b_head: b_head
    })

    cond do
      a_head != b_head -> check_list(a, b_tail, c)
      a_head == b_head -> check_list(a_tail, b_tail, [a_head | c])
      true -> check_list(a_tail, b_tail, c)
    end
  end
end
