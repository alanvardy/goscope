defmodule Goscope.Node.Template do
  @moduledoc "Node types for AST"

  @selections %{
    crud: "Add [c]rud",
    model: "Add [m]odel",
    action: "Add [a]ction",
    method: "Add m[e]thod",
    attribute: "Add a[t]tribute"
  }

  @functions %{
    crud: %{c: :new_crud},
    model: %{m: :new_model},
    action: %{a: :new_action},
    method: %{e: :new_method},
    attribute: %{t: :new_attribute}
  }

  def category do
    children = [
      :model,
      :action,
      :method,
      :attribute
    ]

    build_map("Category", children)
  end

  def model do
    children = [
      :crud,
      :action,
      :method,
      :attribute
    ]

    build_map("Model", children)
  end

  def crud do
    children = [
      :action,
      :method,
      :attribute
    ]

    build_map("CRUD", children)
  end

  def action do
    children = [
      :attribute
    ]

    build_map("Action", children)
  end

  def method do
    children = [
      :attribute
    ]

    build_map("Method", children)
  end

  def attribute do
    children = []

    build_map("Attribute", children)
  end

  defp build_map(type, children) do
    selections =
      @selections
      |> Map.take(children)
      |> Map.values()
      |> List.insert_at(-1, "[d]one")

    functions =
      @functions
      |> Map.take(children)
      |> Map.values()
      |> merge_maps

    %{
      type: type,
      child_types: %{
        selection: selections,
        functions: functions
      }
    }
  end

  defp merge_maps([]), do: %{}
  defp merge_maps([head | []]), do: head

  defp merge_maps([head | tail]) do
    Map.merge(head, merge_maps(tail))
  end
end
