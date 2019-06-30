defmodule Goscope.Node.Model do
  @moduledoc false
  alias Goscope.{Console, Node}

  def create(
        %{
          type: type,
          child_types: child_types,
        },
        breadcrumbs
      ) do
    title =
      type
      |> build_create_input()
      |> Console.get_input()

    case title do
      "c" ->
        []

      _ ->
        %Node{
          name: title,
          type: type,
          children: create_child(:new, child_types, ["#{title}:#{type}" | breadcrumbs])
        }
    end
  end

  defp create_child(input, child_types, breadcrumbs, _children \\ [])

  defp create_child(:new, child_types, breadcrumbs, children) do
    child_types.selection
    |> List.insert_at(0, Console.breadcrumify(breadcrumbs))
    |> Console.get_input()
    |> String.to_atom()
    |> create_child(child_types, breadcrumbs, children)
  end

  defp create_child(child, child_types, breadcrumbs, children) do
    functions = child_types.functions
    keys = functions
    |> Map.keys
    cond do
      child in keys ->
        children = [children | apply(Node, functions[child], [breadcrumbs])]
        create_child(:new, child_types, breadcrumbs, children)
      child == :d ->
        children
      true ->
        create_child(:new, child_types, breadcrumbs, children)
    end
  end

  defp build_create_input(type) do
    [
      "Enter [#{String.downcase(type)} name]",
      "[c]ancel"
    ]
  end
end
