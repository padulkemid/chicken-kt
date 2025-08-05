defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    get_bit(color_count, 1)
  end

  defp get_bit(color_count, bit) do
    bit_count = Integer.pow(2, bit)

    cond do
      bit_count >= color_count -> bit
      true -> get_bit(color_count, bit + 1)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    pixel_bit = palette_bit_size(color_count)

    <<pixel_color_index::size(pixel_bit), picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) do
    pixel_bit = palette_bit_size(color_count)
    get_pixel_in_bits(picture, pixel_bit)
  end

  defp get_pixel_in_bits(<<>>, _), do: nil

  defp get_pixel_in_bits(picture, pixel_bit) do
    <<pixel::size(pixel_bit), rest::bitstring>> = picture

    cond do
      pixel -> pixel
      true -> get_pixel_in_bits(rest, pixel_bit)
    end
  end

  def drop_first_pixel(<<>>, _), do: <<>>
  def drop_first_pixel(picture, color_count) do
    pixel_bit = palette_bit_size(color_count)
    _pixel = get_first_pixel(picture, color_count)

    <<_pixel::size(pixel_bit), rest::bitstring>> = picture

    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
