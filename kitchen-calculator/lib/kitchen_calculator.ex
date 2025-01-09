defmodule KitchenCalculator do
  def get_volume({_unit, value}), do: value

  def to_milliliter({:milliliter, value}), do: {:milliliter, value}
  def to_milliliter({:teaspoon, value}), do: {:milliliter, value * 5}
  def to_milliliter({:tablespoon, value}), do: {:milliliter, value * 15}
  def to_milliliter({:fluid_ounce, value}), do: {:milliliter, value * 30}
  def to_milliliter({:cup, value}), do: {:milliliter, value * 240}

  def from_milliliter(volume_pair, unit) do
    volume = get_volume(volume_pair)

    case unit do
      :milliliter -> {:milliliter, volume}
      :teaspoon -> {:teaspoon, volume / 5}
      :tablespoon -> {:tablespoon, volume / 15}
      :fluid_ounce -> {:fluid_ounce, volume / 30}
      :cup -> {:cup, volume / 240}
    end
  end

  def convert(volume_pair, unit), do: volume_pair |> to_milliliter |> from_milliliter(unit)
end
