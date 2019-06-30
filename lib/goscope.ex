defmodule Goscope do
  @moduledoc "Builds AST for scoping Rails projects"
  alias Goscope.Console
  alias Goscope.Node

  @options [
    "Do you wish to create a CATEGORY?",
    "add [c]ategory",
    "[q]uit"
  ]
  def main(_args \\ []) do
    IO.puts("Welcome to GoScope")
    IO.puts("An amazing command line scoping tool")
    menu([])
  end

  defp menu(categories) do
    input =
      @options
      |> Console.get_input()

    categories
    |> process_input(input)
    |> menu()
  end

  defp process_input(categories, "c") do
    [categories | Node.new_category()]
  end

  defp process_input(_categories, "q") do
    Console.response("Goodbye!")
    System.halt(0)
  end

  defp process_input(categories, _) do
    Console.response("Invalid input, please try again")
    menu(categories)
  end
end
