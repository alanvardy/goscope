defmodule Goscope.Node do
  alias Goscope.Node.{Category, Model}
  defstruct name: nil, type: nil, children: []

  def new_category() do
    Category.create()
  end

  def new_model(breadcrumbs) do
    Model.create(breadcrumbs)
  end

  def new_attribute(_breadcrumbs) do
    "YAY NEW ATTRUBUTES"
  end
end