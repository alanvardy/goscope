defmodule Goscope.Export do
  alias Goscope.Export.{Builder, CSVFile}
  alias Goscope.Console

  def csv([]) do
    IO.puts("Nothing to print")
    []
  end

  def csv(categories) do
    "Enter a filename without extension"
    |> Console.get_input()
    |> CSVFile.create()
    |> Builder.output(categories)
    |> File.close()

    IO.puts("File successfully created!")
    categories
  end
end
