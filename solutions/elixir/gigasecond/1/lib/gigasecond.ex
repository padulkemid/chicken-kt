defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          {{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}
  def from({{year, month, day}, {hours, minutes, seconds}}) do
    {_, naive_date} = NaiveDateTime.new(year, month, day, hours, minutes, seconds)
    add_gigaseconds = NaiveDateTime.add(naive_date, 1_000_000_000)

    {
      {add_gigaseconds.year, add_gigaseconds.month, add_gigaseconds.day},
      {add_gigaseconds.hour, add_gigaseconds.minute, add_gigaseconds.second}
    }
  end
end
