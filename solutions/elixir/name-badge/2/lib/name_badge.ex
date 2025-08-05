defmodule NameBadge do
  def print(nil, name, nil), do: "#{name} - OWNER"
  def print(id, name, nil), do: "[#{id}] - #{name} - OWNER"

  def print(id, name, department) do
    if id != nil do
      "[#{id}] - #{name} - #{String.upcase(department)}"
    else
      "#{name} - #{String.upcase(department)}"
    end
  end
end
