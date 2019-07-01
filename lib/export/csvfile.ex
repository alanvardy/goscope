defmodule Goscope.Export.CSVFile do
  @moduledoc "Works with CSV files"

  @doc "Opens a CSV file, creates a new one if not found"
  @spec create(String.t()) :: pid | {:file_descriptor, atom, any}
  def create(name) do
    {:ok, file} = File.open("#{name}.csv", [:write, :utf8])

    file
  end

  def write(file, output) do
    output
    |> CSV.encode()
    |> Enum.each(&IO.write(file, &1))

    file
  end
end
