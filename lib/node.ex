defmodule Goscope.Node do
  @moduledoc "Builds nodes in AST"
  alias Goscope.Node.{Attribute, Category, Model, Template}
  defstruct name: nil, type: nil, children: []

  def new_category do
    Category.create()
  end

  def new_model(breadcrumbs) do
    Template.model()
    |> Model.create(breadcrumbs)
  end

  def new_attribute(breadcrumbs) do
    Attribute.create(breadcrumbs)
  end
end
