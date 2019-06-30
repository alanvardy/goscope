defmodule Goscope.Console.Display do
  @spec render([String.t()], List.t()) :: :ok
  def render(breadcrumbs, children) do
    IO.puts("\n\n---------------------\n")
    build_list(children)

    br =
      breadcrumbs
      |> Enum.reverse()
      |> Enum.join(" -> ")

    IO.puts(">> #{br} >>")
  end

  defp build_list([]), do: ""

  defp build_list(children) do
    children
    |> Enum.reverse()
    |> Enum.each(fn c -> print_node(c) end)
  end

  defp print_node(node, depth \\ 0)

  defp print_node(%{name: name, type: type, children: []}, depth) do
    (spacing(depth) <> "- #{name} (#{type})")
    |> IO.puts()
  end

  defp print_node(node, depth) do
    (spacing(depth) <> "- #{node.name} (#{node.type})")
    |> IO.puts()

    node.children
    |> Enum.reverse()
    |> Enum.each(fn c -> print_node(c, depth + 1) end)
  end

  defp spacing(depth), do: String.duplicate("  ", depth)
end
