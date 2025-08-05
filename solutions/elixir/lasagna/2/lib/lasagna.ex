defmodule Lasagna do
  def expected_minutes_in_oven() do
    40
  end

  def remaining_minutes_in_oven(min) do
    exp = expected_minutes_in_oven()
    exp - min
  end

  def preparation_time_in_minutes(layer) do
    layer * 2
  end

  def total_time_in_minutes(layer, min) do
    preparation_time_in_minutes(layer) + min
  end

  def alarm() do
    "Ding!"
  end
end
