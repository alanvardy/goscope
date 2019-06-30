defmodule Goscope.Console.Display do
  @moduledoc "Displays summaries to user in console"
  @spec render([String.t()], List.t()) :: :ok
  def render(breadcrumbs, children) do
    IO.puts("\n\n---------------------\n")
    print_list(children)
    print_breadcrumbs(breadcrumbs)
  end

  defp print_list([]), do: ""

  defp print_list(children) do
    children
    |> Enum.reverse()
    |> Enum.each(fn c -> print_node(c) end)

    IO.puts("")
  end

  defp print_node(node, depth \\ 0)

  defp print_node(node, depth) do
    depth
    |> spacing()
    |> Kernel.<>("- #{node.name} (#{node.type})")
    |> IO.puts()

    node.children
    |> Enum.reverse()
    |> Enum.each(fn c -> print_node(c, depth + 1) end)
  end

  defp spacing(depth), do: String.duplicate("  ", depth)

  defp print_breadcrumbs([]), do: IO.puts(">> ROOT >>\n")

  defp print_breadcrumbs(breadcrumbs) do
    br =
      breadcrumbs
      |> Enum.reverse()
      |> Enum.join(" -> ")

    IO.puts(">> #{br} >>\n")
  end
end
