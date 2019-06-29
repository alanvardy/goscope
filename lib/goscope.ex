defmodule Goscope do
  alias Goscope.{Category, Print}

  @commands [
    "[c]reate a category",
    "[q]uit"
  ]
  def main(_args \\ []) do
    IO.puts("Welcome to GoScope")
    IO.puts("An amazing command line scoping tool")
    menu([])
  end

  defp menu(cats) do
    IO.puts("Do you wish to create a CATEGORY?")

    input = @commands
    |> Print.get_input

    cats = process_input(cats, input)

    menu(cats)
  end

  defp process_input(cats, "c") do
    [cats | Category.create]
  end

  defp process_input(_cats, "q") do
    Print.response("Goodbye!")
    System.halt(0)
  end

  defp process_input(cats, _) do
    Print.response("Invalid input, please try again")
    menu(cats)
  end
end
