defmodule Goscope.Export.Entries do
  def headers do
    [
      "Effort",
      "Risk",
      "Category",
      "Hours",
      "Feature",
      "Notes"
    ]
  end

  def build(%{name: name, type: "Model"}, cat) do
    [["", "", "", cat, "Add model: #{name}", ""]]
  end

  def build(%{name: name, type: "CRUD"}, cat) do
    [
      [1, 1, "", cat, "Add #{name}Controller", ""],
      [0.5, 1, "", cat, "Add #{name}Controller#index", ""],
      [0.5, 1, "", cat, "Add #{name}Controller#show", ""],
      [0.5, 1, "", cat, "Add #{name}Controller#new", ""],
      [0.5, 1, "", cat, "Add #{name}Controller#create", ""],
      [0.5, 1, "", cat, "Add #{name}Controller#edit", ""],
      [0.5, 1, "", cat, "Add #{name}Controller#update", ""],
      [0.5, 1, "", cat, "Add #{name}Controller#destroy", ""],
      [1, 1, "", cat, "Add #{name}/index page", ""],
      [0.5, 1, "", cat, "Add #{name}/edit page", ""],
      [0.5, 1, "", cat, "Add #{name}/new page", ""],
      [1, 1, "", cat, "Add #{name}/show page", ""],
      [1, 1, "", cat, "Add #{name}/_form partial", ""],
      [0.5, 1, "", cat, "Add routes for CRUD actions in #{name}Controller", ""],
      [1, 1, "", cat, "Add #{name} Datatable", ""],
      [0.5, 1, "", cat, "Add Logging for all actions in #{name}Controller", ""],
      [0.5, 1, "", cat, "Add authorization for all actions in #{name}Controller", ""]
    ]
  end

  def build(%{name: name, type: "Method"}, cat) do
    [
      ["", "", "", cat, "Add #{name} method to model", ""],
      ["", "", "", cat, "EMAIL FOR #{name} METHOD?", ""],
      ["", "", "", cat, "Add Logging for #{name} method", ""]
    ]
  end

  def build(%{name: name, type: "Action"}, cat) do
    [
      ["", "", "", cat, "Add #{name} action to controller", ""],
      ["", "", "", cat, "Add route for #{name} action", ""],
      ["", "", "", cat, "Add #{name} to model", ""],
      ["", "", "", cat, "Add authorization for #{name} action", ""],
      ["", "", "", cat, "EMAIL FOR #{name} ACTION?", ""],
      ["", "", "", cat, "Add Logging for #{name} action", ""]
    ]
  end

  def build(%{name: name, type: "Attribute"}, cat) do
    [
      ["", "", "", cat, "Add #{name} attribute", ""],
      ["", "", "", cat, "Add Validations for #{name} attribute", ""],
      ["", "", "", cat, "Add migration for old records", ""],
      ["", "", "", cat, "Add #{name} attribute to datatables", ""]
    ]
  end
end
