defmodule ManyToManyWeb.PageController do
  use ManyToManyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
