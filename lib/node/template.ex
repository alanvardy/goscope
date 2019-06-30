defmodule Goscope.Node.Template do
  @moduledoc "Node types for AST"
  def category do
    %{
      type: "Category",
      create_options: [
          "Enter category name:",
          "[c]ancel"
        ],
      child_options: [
        "[m]odel",
        "[d]one"
      ]
    }
  end

  def model do
    %{
      type: "Model",
      create_options: [
          "Enter model name:",
          "[c]ancel"
        ],
      child_options: [
        "[a]attribute",
        "[d]one"
      ]
    }
  end
end
