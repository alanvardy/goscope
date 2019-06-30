defmodule Goscope.Node.Category do
  @moduledoc false
  alias Goscope.{Console, Node}
  alias Goscope.Node.Template

  @create_options [
    "Enter category name:",
    "[c]ancel"
  ]

  @nodetype "Category"

  @child_options [
    "[m]odel",
    "[d]one"
  ]
  @doc "Create a node struct with category"
  def create do
    title =
      @create_options
      |> Console.get_input()

    case title do
      "c" -> []
      _ -> %Node{
        name: title,
        type: @nodetype,
        children: create_child(:new, ["#{title}:#{@nodetype}"])}
    end
  end

  defp create_child(input, breadcrumbs, _children \\ [])
  defp create_child(:new , breadcrumbs, children) do
    @child_options
    |> List.insert_at(0, Console.breadcrumify(breadcrumbs))
    |> Console.get_input()
    |> create_child(breadcrumbs, children)
  end

  # Done adding children
  defp create_child("d", _breadcrumbs, children) do
    children
  end

  # Add a model
  defp create_child("m", breadcrumbs, children) do
    create_child(:new, breadcrumbs, [children | Node.new_model(breadcrumbs)])
  end

  # Bad input
  defp create_child(_, breadcrumbs, children) do
    create_child(:new, breadcrumbs, children)
  end
end
