defmodule Goscope.Node.Model do
  alias Goscope.{Console, Node}

  @model_options [
    "Enter model name:",
    "[c]ancel"
  ]

  @nodetype "Model"

  @child_options [
    "[a]ttribute",
    "[d]one"
  ]
  def create(breadcrumbs) do
    title =
      @model_options
      |> Console.get_input()

    case title do
      "c" -> []
      _ -> %Node{
        name: title,
        type: @nodetype,
        children: create_child(:new, ["#{title}:#{@nodetype}" | breadcrumbs])}
    end
  end

  defp create_child(input, breadcrumbs, _children \\ [])
  defp create_child(:new , breadcrumbs, children) do


    @child_options
    |> List.insert_at(0, Console.breadcrumify(breadcrumbs))
    |> Console.get_input()
    |> create_child(breadcrumbs, children)
  end

  defp create_child("d", _breadcrumbs, children) do
    children
  end

  defp create_child("a", breadcrumbs, children) do
    create_child(:new, breadcrumbs, [children | Node.new_attribute(breadcrumbs)])
  end

  defp create_child(_, breadcrumbs, children) do
    create_child(:new, breadcrumbs, children)
  end
end
