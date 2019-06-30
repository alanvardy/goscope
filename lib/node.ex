defmodule Goscope.Node do
  @moduledoc "Builds nodes in AST"
  alias Goscope.Node.{Behaviour, Template}
  defstruct name: nil, type: nil, children: []

  @spec new_category :: Goscope.Node.t()
  def new_category do
    Template.category()
    |> Behaviour.create([])
  end

  @spec new_crud([String.t()]) :: Goscope.Node.t()
  def new_crud(breadcrumbs) do
    Template.crud()
    |> Behaviour.create(breadcrumbs)
  end

  @spec new_model([String.t()]) :: Goscope.Node.t()
  def new_model(breadcrumbs) do
    Template.model()
    |> Behaviour.create(breadcrumbs)
  end

  @spec new_action([String.t()]) :: Goscope.Node.t()
  def new_action(breadcrumbs) do
    Template.action()
    |> Behaviour.create(breadcrumbs)
  end

  @spec new_method([String.t()]) :: Goscope.Node.t()
  def new_method(breadcrumbs) do
    Template.method()
    |> Behaviour.create(breadcrumbs)
  end

  @spec new_attribute([String.t()]) :: Goscope.Node.t()
  def new_attribute(breadcrumbs) do
    Template.attribute()
    |> Behaviour.create(breadcrumbs)
  end
end
