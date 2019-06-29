defmodule Goscope.Print do
  def get_input(commands) when is_list(commands) do
    commands
    |> Enum.each(fn c -> IO.puts(c) end)

    get()
  end

  def get_input(command) when is_bitstring(command) do
    IO.puts command
    get()
  end

  def response(text) do
    break()
    IO.puts("-- " <> text <> " --")
  end

  defp break do
    IO.puts("\n\n---------------------\n")
  end

  defp get do
    IO.gets("> ")
    |> String.trim()
    |> String.downcase()
  end
end
