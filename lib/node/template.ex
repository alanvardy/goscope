defmodule Goscope.Node.Template do
  @moduledoc "Node types for AST"
  def category do
    %{
      type: "Category",
      child_options: [
        "Add [m]odel",
        "[d]one"
      ]
    }
  end

  def model do
    %{
      type: "Model",
        child_types: %{
          selection: [
            "Add [a]ttribute",
            "[d]one"
          ],
        functions: %{
          a: :new_attribute
        }
      }
    }
  end
end
