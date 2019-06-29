defmodule Goscope.Print do
  def options(commands) do
    commands
    |> Enum.each(fn c -> IO.puts(c) end)
  end

  def get_input do
    IO.gets("> ")
    |> String.trim()
    |> String.downcase()
  end

  def response(text) do
    break()
    IO.puts("-- " <> text <> " --")
  end

  def break do
    IO.puts("\n\n---------------------\n")
  end
end
