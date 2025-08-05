defmodule RationalNumbers do
  @type rational :: {integer, integer}

  defp div_gcd(n, d) do
    g = Integer.gcd(n, d)
    num = div(n, g)
    denum = div(d, g)

    cond do
      denum < 0 -> {-num, -denum}
      true -> {num, denum}
    end
  end

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2, b2}) do
    n = (a1 * b2) + (a2 * b1)
    d = b1 * b2

    div_gcd(n, d)
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}) do
    n = (a1 * b2) - (a2 * b1)
    d = b1 * b2

    div_gcd(n, d)
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}) do
    n = a1 * a2
    d = b1 * b2

    div_gcd(n, d)
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}) do
    n = a1 * b2
    d = a2 * b1

    div_gcd(n, d)
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}) do
    a = if a < 0, do: -a, else: a
    b = if b < 0, do: -b, else: b

    div_gcd(a, b)
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a, b}, n) when n < 0 do
    num = Integer.pow(b, -n)
    denum = Integer.pow(a, -n)

    div_gcd(num, denum)
  end

  def pow_rational({a, b}, n) do 
    num = Integer.pow(a, n)
    denum = Integer.pow(b, n)

    div_gcd(num, denum)
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}) do
    n1 = :math.pow(x, a)
   :math.pow(n1, 1.0 / b)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a, b}) do
    div_gcd(a, b)
  end
end
