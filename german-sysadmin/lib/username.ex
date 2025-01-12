defmodule Username do
  def sanitize([]), do: []

  def sanitize([char | rest]) do
    cleansed =
      case char do
        ?ß -> ~c"ss"
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        x when x >= ?a and x <= ?z -> [x]
        ?_ -> ~c"_"
        _ -> ~c""
      end

    cleansed ++ sanitize(rest)
  end
end
