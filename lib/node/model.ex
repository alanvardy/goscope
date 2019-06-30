defmodule Goscope.Node.Model do
  @moduledoc false
  alias Goscope.{Console, Node}

  def create(
        %{
          create_options: create_options,
          type: type,
          child_options: child_options
        },
        breadcrumbs
      ) do
    title =
      create_options
      |> Console.get_input()

    case title do
      "c" ->
        []

      _ ->
        %Node{
          name: title,
          type: type,
          children: create_child(:new, child_options, ["#{title}:#{type}" | breadcrumbs])
        }
    end
  end

  defp create_child(input, options, breadcrumbs, _children \\ [])

  defp create_child(:new, options, breadcrumbs, children) do
    options
    |> List.insert_at(0, Console.breadcrumify(breadcrumbs))
    |> Console.get_input()
    |> create_child(options, breadcrumbs, children)
  end

  defp create_child("d", _options, _breadcrumbs, children) do
    children
  end

  defp create_child("a", options, breadcrumbs, children) do
    create_child(:new, options, breadcrumbs, [children | Node.new_attribute(breadcrumbs)])
  end

  defp create_child(_, options, breadcrumbs, children) do
    create_child(:new, options, breadcrumbs, children)
  end
end
