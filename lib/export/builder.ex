defmodule Goscope.Export.Builder do
  @headers [
    "First",
    "Second"
  ]
  def output(file, categories) do
    categories
    |> rows()
    |> Enum.reverse()
    |> List.insert_at(0, @headers)
    |> CSV.encode()
    |> Enum.each(&IO.write(file, &1))

    file
  end

  defp rows(data, agg \\ [])
  defp rows([], agg), do: agg

  defp rows([head | tail], agg) do
    agg = agg ++ build_row(head)
    agg = rows(head.children, agg)
    rows(tail, agg)
  end

  defp build_row(item) do
    [[item.name]]
  end
end
