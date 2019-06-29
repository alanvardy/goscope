defmodule Goscope do
  alias Goscope.Print

  @commands [
    "[c]reate a category",
    "[q]uit"
  ]
  def main(_args \\ []) do
    IO.puts("Welcome to GoScope")
    IO.puts("An amazing command line scoping tool")
    menu()
  end

  defp menu() do
    IO.puts("Do you wish to create a CATEGORY?")
    Print.options(@commands)
    process_input(Print.get_input)
    menu()
  end

  defp process_input("c") do
    Print.break()
    IO.puts "CREATING CATEGORY"
  end

  defp process_input("q") do
    Print.break()
    IO.puts "Goodbye!"
    System.halt(0)
  end

  defp process_input(_) do
    Print.break()
    IO.puts "Invalid input, please try again"
    menu()
  end
end
