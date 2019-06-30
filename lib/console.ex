defmodule Goscope.Console do
  @moduledoc "Various functions for passing information to and from user"
  alias Goscope.Console.{Display, Input}

  @spec get_input(String.t() | [String.t()]) :: String.t()
  def get_input(commands), do: Input.request(commands)

  @spec render_display(List.t(), List.t()) :: :ok
  def render_display(breadcrumbs, children) do
    Display.render(breadcrumbs, children)
  end

  @spec response(String.t()) :: :ok
  def response(text) do
    IO.puts("-- " <> text <> " --")
  end
end
