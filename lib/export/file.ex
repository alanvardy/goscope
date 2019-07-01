defmodule Goscope.Export.CSVFile do
  def create(name) do
    {:ok, file} = File.open("#{name}.csv", [:write, :utf8])

    file
  end
end
