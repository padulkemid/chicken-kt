defmodule Ledger do
  @eur "€"
  @usd "$"

  # ref 5: headers and entries
  defp format_header(locale)
  defp format_header(:en_US), do: "Date       | Description               | Change       \n"
  defp format_header(_), do: "Datum      | Omschrijving              | Verandering  \n"

  defp get_entries(header, _, _, []), do: header

  defp get_entries(header, currency, locale, entries) do
    entries =
      Enum.sort(entries, fn a, b ->
        cond do
          a.date.day < b.date.day -> true
          a.date.day > b.date.day -> false
          a.description < b.description -> true
          a.description > b.description -> false
          true -> a.amount_in_cents <= b.amount_in_cents
        end
      end)
      |> Enum.map(fn entry -> format_entry(currency, locale, entry) end)
      |> Enum.join("\n")

    "#{header}#{entries}\n"
  end

  @doc """
  Format the given entries given a currency and locale
  """
  @type currency :: :usd | :eur
  @type locale :: :en_US | :nl_NL
  @type entry :: %{amount_in_cents: integer(), date: Date.t(), description: String.t()}

  @spec format_entries(currency(), locale(), list(entry())) :: String.t()
  def format_entries(currency, locale, entries) do
    header = format_header(locale)

    get_entries(header, currency, locale, entries)
  end

  # ref 1: dates
  defp get_date(date) do
    year = date.year |> to_string()
    month = date.month |> to_string() |> String.pad_leading(2, "0")
    day = date.day |> to_string() |> String.pad_leading(2, "0")

    {year, month, day}
  end

  defp format_date(date, locale)
  defp format_date({year, month, day}, :nl_NL), do: day <> "-" <> month <> "-" <> year <> " "
  defp format_date({year, month, day}, :en_US), do: month <> "/" <> day <> "/" <> year <> " "

  # ref 2: numbers
  defp get_decimal(amount_in_cents),
    do:
      amount_in_cents
      |> abs
      |> rem(100)
      |> to_string()
      |> String.pad_leading(2, "0")

  defguardp is_less_than_thousands(amount_in_cents)
            when abs(div(amount_in_cents, 100)) < 1000

  defp whole_decimals_division(amount_in_cents) do
    whole =
      div(amount_in_cents, 100)
      |> abs
      |> div(1000)
      |> to_string

    decimals =
      div(amount_in_cents, 100)
      |> abs
      |> rem(1000)
      |> to_string

    {whole, decimals}
  end

  defp get_separator(:en_US, :whole), do: ","
  defp get_separator(:en_US, :all), do: "."
  defp get_separator(_, :whole), do: "."
  defp get_separator(_, :all), do: ","

  defp format_numbers({whole, decimals}, locale, type) do
    separator = get_separator(locale, type)
    "#{whole}#{separator}#{decimals}"
  end

  defp get_whole_numbers(amount_in_cents, locale)

  defp get_whole_numbers(amount_in_cents, _)
       when is_less_than_thousands(amount_in_cents),
       do:
         div(amount_in_cents, 100)
         |> abs
         |> to_string

  defp get_whole_numbers(amount_in_cents, locale),
    do:
      whole_decimals_division(amount_in_cents)
      |> format_numbers(locale, :whole)

  defp get_decimal_and_whole(amount_in_cents, locale),
    do: {
      get_whole_numbers(amount_in_cents, locale),
      get_decimal(amount_in_cents)
    }

  # ref 3: amount
  defguardp is_amount_positive(amount_in_cents)
            when is_number(amount_in_cents) and amount_in_cents >= 0

  # positive amount_in_cents
  defp translate_amount_pos(number, :en_US, :eur), do: "  #{@eur}#{number} "
  defp translate_amount_pos(number, :en_US, :usd), do: "  #{@usd}#{number} "
  defp translate_amount_pos(number, :nl_NL, :eur), do: " #{@eur} #{number} "
  defp translate_amount_pos(number, :nl_NL, :usd), do: " #{@usd} #{number} "

  # negative amount_in_cents
  defp translate_amount_neg(number, :en_US, :eur), do: " (#{@eur}#{number})"
  defp translate_amount_neg(number, :en_US, :usd), do: " (#{@usd}#{number})"
  defp translate_amount_neg(number, :nl_NL, :eur), do: " #{@eur} -#{number} "
  defp translate_amount_neg(number, :nl_NL, :usd), do: " #{@usd} -#{number} "

  defp get_amount(number, locale, currency, amount_in_cents)
       when is_amount_positive(amount_in_cents),
       do: translate_amount_pos(number, locale, currency)

  defp get_amount(number, locale, currency, _), do: translate_amount_neg(number, locale, currency)

  # ref 4: string guard
  defguardp is_length_good?(desc) when byte_size(desc) > 26

  defp check_desc_length(desc) when is_length_good?(desc), do: " #{String.slice(desc, 0, 22)}..."
  defp check_desc_length(desc), do: ~s( #{String.pad_trailing(desc, 25, " ")})

  defp format_entry(currency, locale, entry) do
    date =
      get_date(entry.date)
      |> format_date(locale)

    number =
      get_decimal_and_whole(entry.amount_in_cents, locale)
      |> format_numbers(locale, :all)

    amount =
      get_amount(number, locale, currency, entry.amount_in_cents)
      |> String.pad_leading(14, " ")

    description = check_desc_length(entry.description)

    "#{date}|#{description} |#{amount}"
  end
end
