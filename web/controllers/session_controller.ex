defmodule Chatto.SessionController do
  use Chatto.Web, :controller


  def new(conn, _) do
   render conn, "new.html"
  end

  def create(conn, %{"session" => %{"username" => user, "password" => pass}}) do
    case Chatto.Auth.login_by_username_and_pass(conn, user, pass, repo: Repo) do
     {:ok, conn} ->
      conn
      |> put_flash(:info, "Welcome to Chatt")
      |> redirect(to: page_path(conn, :page))
     {:error, _reason, conn} ->
      conn
      |> put_flash(:error, "Invalid username/password combination")
      |> render("new.html")
    end
  end
  def delete(conn, _) do
    conn
    |> Chatto.Auth.logout()
    |> redirect(to: session_path(conn, :new))
  end
end