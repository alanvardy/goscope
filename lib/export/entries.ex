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
    [[1, 1, "", cat, "Add model: #{name}", ""]]
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
      [1, 1, "", cat, "Add #{name} datatable", ""],
      [0.5, 1, "", cat, "Add logging for all actions in #{name}Controller", ""],
      [0.5, 1, "", cat, "Add authorization for all actions in #{name}Controller", ""]
    ]
  end

  def build(%{name: name, type: "Method"}, cat) do
    [
      [0.5, 1, "", cat, "Add #{name} method to model", ""],
      [0.5, 1, "", cat, "EMAIL FOR #{name} METHOD?", ""],
      [0.5, 1, "", cat, "Add logging for #{name} method", ""]
    ]
  end

  def build(%{name: name, type: "Action"}, cat) do
    [
      [1, 1, "", cat, "Add #{name} action to controller", ""],
      [0.5, 1, "", cat, "Add route for #{name} action", ""],
      [1, 1, "", cat, "Add #{name} action to model", ""],
      [0.5, 1, "", cat, "Add authorization for #{name} action", ""],
      [0.5, 1, "", cat, "EMAIL FOR #{name} ACTION?", ""],
      [0.5, 1, "", cat, "Add logging for #{name} action", ""]
    ]
  end

  def build(%{name: name, type: "Attribute"}, cat) do
    [
      [0.25, 1, "", cat, "Add #{name} attribute", ""],
      [0.25, 1, "", cat, "Add validations for #{name} attribute", ""],
      [0.5, 1, "", cat, "Add migration for old records", ""],
      [0.5, 1, "", cat, "Add #{name} attribute to datatables", ""]
    ]
  end
end
