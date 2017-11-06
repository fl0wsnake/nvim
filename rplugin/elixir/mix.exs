defmodule Elixir.Mixfile do
  use Mix.Project

  def project do
    [apps_path: "apps",
     deps: [{:nvim, "0.4.2"}]]
  end
end
