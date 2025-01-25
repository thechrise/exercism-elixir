defmodule LogParser do
  def valid_line?(line) do
    # Match one of the following: [DEBUG], [INFO], [WARNING], [ERROR]
    String.match?(line, ~r/^\[(DEBUG|INFO|WARNING|ERROR)\]/)
  end

  def split_line(line) do
    # Please implement the split_line/1 function
    # any string that has a first character of <, a last character of >, and any combination of the following characters ~, *, =, and - in between can be used as a separator in this project's logs
    String.split(line, ~r/<[~*=\-*]*\>/)
  end

  def remove_artifacts(line) do
    # remove ""end-of-line" followed by a line number" followed by a line number from a string
    String.replace(line, ~r/end-of-line(\d+)/i, "")
  end

  def tag_with_user_name(line) do
    match = Regex.run(~r/User\s+(\S+)/, line)

    if(match) do
      "[USER] #{Enum.at(match, 1)} " <> line
    else
      line
    end

    # Please implement the tag_with_user_name/1 function
  end
end
