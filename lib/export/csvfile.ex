defmodule Goscope.Export.CSVFile do
  @moduledoc "Works with CSV files"
  def create(name) do
    {:ok, file} = File.open("#{name}.csv", [:write, :utf8])

    file
  end
end
