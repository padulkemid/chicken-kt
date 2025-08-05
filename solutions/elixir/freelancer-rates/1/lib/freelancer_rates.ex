defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    d = discount * 0.01
    d_price = before_discount * d

    before_discount - d_price
  end

  def monthly_rate(hourly_rate, discount) do
    r = daily_rate(hourly_rate) * 22

    apply_discount(r, discount) |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    d_rate = daily_rate(hourly_rate) |> apply_discount(discount) 
    budget / d_rate |> Float.floor(1)
  end
end
