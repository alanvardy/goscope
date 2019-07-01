defmodule Goscope do
  @moduledoc "Builds AST for scoping Rails projects"
  alias Goscope.{Console, Export, Node}

  @options [
    "Add [c]ategory",
    "E[x]port CSV",
    "[q]uit"
  ]
  @spec main(any) :: no_return
  def main(_args \\ []) do
    IO.puts("Welcome to GoScope")
    IO.puts("An amazing command line scoping tool")
    menu([])
  end

  defp menu(categories) do
    Console.render_display([], categories)
    input =
      @options
      |> Console.get_input()

    categories
    |> process_input(input)
    |> menu()
  end

  defp process_input(categories, "c") do
    [Node.new_category() | categories]
  end

  defp process_input(categories, "x") do
    Export.csv(categories)
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
