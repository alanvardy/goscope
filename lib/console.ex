defmodule Goscope.Console do
  @moduledoc "Various functions for passing information to and from user"
  def get_input(commands) when is_list(commands) do
    commands
    |> Enum.each(fn c -> IO.puts(c) end)

    get()
  end

  def get_input(command) when is_bitstring(command) do
    IO.puts(command)
    get()
  end

  def response(text) do
    break()
    IO.puts("-- " <> text <> " --")
  end

  def breadcrumify(breadcrumbs) do
    br =
      breadcrumbs
      |> Enum.reverse()
      |> Enum.join(" -> ")

    break() <> br <> "\n"
  end

  defp break do
    "\n\n---------------------\n"
  end

  defp get do
    IO.gets("> ")
    |> String.trim()
  end
end
