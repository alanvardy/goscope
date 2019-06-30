defmodule Goscope.Console.Input do
  def request(commands) when is_list(commands) do
    commands
    |> Enum.each(fn c -> IO.puts(c) end)

    get()
  end

  def request(command) when is_bitstring(command) do
    IO.puts(command)
    get()
  end

  defp get do
    IO.gets("> ")
    |> String.trim()
  end
end
