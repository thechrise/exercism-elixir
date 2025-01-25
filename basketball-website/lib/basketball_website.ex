defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    extract_from_list(data, String.split(path, "."))
  end

  defp extract_from_list(nil, _), do: nil
  defp extract_from_list(data, []), do: data
  defp extract_from_list(data, [key | tail]), do: extract_from_list(data[key], tail)

  def get_in_path(data, path) do
    Kernel.get_in(data, String.split(path, "."))
  end
end
