defmodule Goscope.Export.Builder do
  @headers [
    "Effort",
    "Risk",
    "Category",
    "Hours",
    "Feature",
    "Notes"
  ]
  def output(file, categories) do
    categories
    |> build_category
    |> Enum.reverse()
    |> List.insert_at(0, @headers)
    |> CSV.encode()
    |> Enum.each(&IO.write(file, &1))

    file
  end

  defp build_category(categories, agg \\ [])
  defp build_category([], agg), do: agg

  defp build_category([head | tail], agg) do
    new_agg = rows(head.children, head.name, agg)
    build_category(tail, agg ++ new_agg)
  end

  defp rows([], _cat, agg), do: agg

  defp rows([head | tail], cat, agg) do
    agg = agg ++ build_row(head, cat)
    agg = rows(head.children, cat, agg)
    rows(tail, cat, agg)
  end

  defp build_row(item, cat) do
    [["", "", "", cat, item.name, ""]]
  end
end
