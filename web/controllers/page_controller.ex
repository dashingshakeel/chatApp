defmodule Chatto.PageController do
  use Chatto.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
  def page(conn,_params)do
    render conn, "page.html"
  end
end
