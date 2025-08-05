defmodule LogParser do
  def valid_line?(line) do
    line =~ ~r/^\[(DEBUG|INFO|WARNING|ERROR)\]/
  end

  def split_line(line) do
    Regex.split(~r/<[*\~=\-]*>/, line)
  end

  def remove_artifacts(line) do
    Regex.replace(~r/end-of-line\d+/i, line, "")
  end

  def tag_with_user_name(line) do
    get_user = Regex.run(~r/\bUser\s+(\S+)/, line)

    case get_user do
      [_, username] -> "[USER] #{username} #{line}"
      _ -> line
    end
  end
end
