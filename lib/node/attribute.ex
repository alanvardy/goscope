defmodule Goscope.Node.Attribute do
  @moduledoc false
  alias Goscope.{Console, Node}

  @create_options [
    "Enter attribute name:",
    "[c]ancel"
  ]

  @nodetype "Attribute"

  @child_options [
    "[d]one"
  ]
  def create(breadcrumbs) do

    title =
      @create_options
      |> Console.get_input()

    case title do
      "c" ->
        []

      _ ->
        %Node{
          name: title,
          type: @nodetype,
          children: create_child(:new, ["#{title}:#{@nodetype}" | breadcrumbs])
        }
    end
  end

  defp create_child(input, breadcrumbs, _children \\ [])

  defp create_child(:new, breadcrumbs, children) do
    @child_options
    |> List.insert_at(0, Console.breadcrumify(breadcrumbs))
    |> Console.get_input()
    |> create_child(breadcrumbs, children)
  end

  defp create_child("d", _breadcrumbs, children) do
    children
  end

  defp create_child(_, breadcrumbs, children) do
    create_child(:new, breadcrumbs, children)
  end
end
