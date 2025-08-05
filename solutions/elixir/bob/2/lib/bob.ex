defmodule Bob do
  @conditions %{
    fine: ~r/^\s*$/,
    calm: ~r/^[^\p{Ll}]*\p{Lu}[^\p{Ll}]*\?\s*$/u,
    chill: ~r/^[^\p{Ll}]*\p{Lu}[^\p{Ll}]*$/u,
    sure: ~r/^(?![^\p{Ll}]*\p{Lu}[^\p{Ll}]*\?$).*\?\s*$/u
  }

  @doc """
  This will output bob stuff
  """
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    cond do
      Regex.match?(@conditions.fine, input) -> "Fine. Be that way!"
      Regex.match?(@conditions.calm, input) -> "Calm down, I know what I'm doing!"
      Regex.match?(@conditions.chill, input) -> "Whoa, chill out!"
      Regex.match?(@conditions.sure, input) -> "Sure."
      true -> "Whatever."
    end
  end
end
