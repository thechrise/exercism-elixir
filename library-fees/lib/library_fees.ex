defmodule LibraryFees do
  @checkout_days 28

  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    checkout_datetime
    |> NaiveDateTime.to_date()
    |> Date.add(checkout_duration(checkout_datetime))
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
    |> Date.diff(planned_return_date)
    |> max(0)
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week() == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    expected_return = datetime_from_string(checkout) |> return_date()
    actual_return = datetime_from_string(return)

    final_rate = if monday?(actual_return), do: rate * 0.5, else: rate

    (days_late(expected_return, actual_return) * final_rate)
    |> floor()
  end

  defp checkout_duration(datetime) do
    case before_noon?(datetime) do
      true -> @checkout_days
      false -> @checkout_days + 1
    end
  end
end
