defmodule Goscope.Export do
  @moduledoc "For exporting data in a useful format"
  alias Goscope.Console
  alias Goscope.Export.{Builder, CSVFile}

  @spec csv([List.t() | %{children: [any], name: any}]) :: [List.t() | %{children: [any], name: any}]
  def csv([]) do
    IO.puts("Nothing to print")
    []
  end

  def csv(categories) do
    output = Builder.build(categories)

    "Enter a filename without extension"
    |> Console.get_input()
    |> CSVFile.create()
    |> CSVFile.write(output)
    |> File.close()

    IO.puts("File successfully created!")
    categories
  end
end
