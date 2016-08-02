defmodule Chatto.UserController do
use Chatto.Web, :controller
def index(conn, _params) do
users = Repo.all(Chatto.User)
render conn, "index.html", users: users
end
end