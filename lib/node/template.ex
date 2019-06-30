defmodule Goscope.Node.Template do
  @moduledoc "Node types for AST"
  def category do
    %{
      type: "Category",
      child_types: %{
        selection: [
          "Add [m]odel",
          "[d]one"
        ],
        functions: %{
          m: :new_model
        }
      }
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

  def attribute do
    %{
      type: "Attribute",
      child_types: %{
        selection: [
          "[d]one"
        ],
        functions: %{}
      }
    }
  end
end
