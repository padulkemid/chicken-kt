defmodule LibraryFees do
  def datetime_from_string(string) do
    {_, date} = NaiveDateTime.from_iso8601(string)

    date
  end

  def before_noon?(datetime) do
    date = NaiveDateTime.to_date(datetime)
    {_, datetime2} = NaiveDateTime.new(date, ~T[12:00:00])

    NaiveDateTime.before?(datetime, datetime2)
  end

  def return_date(checkout_datetime) do
    if before_noon?(checkout_datetime) do
      NaiveDateTime.add(checkout_datetime, 28, :day) |> NaiveDateTime.to_date()
    else
      NaiveDateTime.add(checkout_datetime, 29, :day) |> NaiveDateTime.to_date()
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    {_, datetime} = NaiveDateTime.new(planned_return_date, ~T[00:00:00])
    days = NaiveDateTime.diff(actual_return_datetime, datetime, :day)

    cond do
      days < 0 -> 0
      true -> days
    end
  end

  def monday?(datetime) do
    day = Calendar.strftime(datetime, "%A")

    cond do
      day != "Monday" -> false
      true -> true
    end
  end

  def calculate_late_fee(checkout, return, rate) do
    co = datetime_from_string(checkout) |> return_date()
    actual = datetime_from_string(return)
    late = days_late(co, actual)
    price = late * rate

    cond do
      monday?(actual) -> floor(price / 2)
      true -> price
    end
  end
end
