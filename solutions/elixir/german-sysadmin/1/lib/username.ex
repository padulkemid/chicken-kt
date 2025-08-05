defmodule Username do
  @spec sanitize(charlist) :: charlist()
  def sanitize(username) do
    clean_name(username, [])
  end

  @spec clean_name(username :: charlist, result :: charlist) :: charlist()
  defp clean_name([], result), do: Enum.reverse(result)

  defp clean_name([head | tail], result) do
    filter =
      case head do
        head when head >= ?a and head <= ?z -> [head | result]
        ?_ -> [head | result]
        ?ä -> ~c"ea" ++ result
        ?ö -> ~c"eo" ++ result
        ?ü -> ~c"eu" ++ result
        ?ß -> ~c"ss" ++ result
        _ -> result
      end

    clean_name(tail, filter)
  end
end
