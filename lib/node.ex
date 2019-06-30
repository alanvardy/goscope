defmodule Goscope.Node do
  @moduledoc "Builds nodes in AST"
  alias Goscope.Node.{Behaviour, Template}
  defstruct name: nil, type: nil, children: []

  def new_category do
    Template.category()
    |> Behaviour.create([])
  end

  def new_model(breadcrumbs) do
    Template.model()
    |> Behaviour.create(breadcrumbs)
  end

  def new_action(breadcrumbs) do
    Template.action()
    |> Behaviour.create(breadcrumbs)
  end

  def new_attribute(breadcrumbs) do
    Template.attribute()
    |> Behaviour.create(breadcrumbs)
  end
end
