defmodule ResistorColorTrio do
  @giga 1_000_000_000
  @mega 1_000_000
  @kilo 1_000
  @encoded_colors %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colors) do
    map_color = fn color -> Map.get(@encoded_colors, color) end

    value =
      Enum.map(colors, map_color)
      |> Enum.take(2)
      |> Enum.join()

    get_unit = Enum.at(colors, 2)
    unit_check = Map.get(@encoded_colors, get_unit)
    trails = String.pad_trailing(value, 2 + unit_check, "0")

    String.to_integer(trails) |> convert_ohms()
  end

  def convert_ohms(value) when value >= @giga, do: {div(value, @giga), :gigaohms}
  def convert_ohms(value) when value >= @mega, do: {div(value, @mega), :megaohms}
  def convert_ohms(value) when value >= @kilo, do: {div(value, @kilo), :kiloohms}
  def convert_ohms(value), do: {value, :ohms}
end
