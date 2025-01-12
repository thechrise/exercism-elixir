defmodule NameBadge do
  def print(id, name, department) do
    id_string = get_id_string(id)
    department_string = get_department_string(department)

    "#{id_string} #{name} - #{department_string}" |> String.trim()
  end

  defp get_id_string(id) do
    if id != nil, do: "[#{id}] -", else: ""
  end

  defp get_department_string(department) do
    if department != nil, do: String.upcase(department), else: "OWNER"
  end
end
