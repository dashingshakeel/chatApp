defmodule Chatto.RoomChannel do
  use Phoenix.Channel

  
 def join("room:lobby", _message, socket) do
    {:ok, socket}
  end
  

  def handle_in("new_msg", %{"user"=> user,"body" => body}, socket) do
    broadcast! socket, "new_msg", %{user: user ,body: body}
   {:reply, :ok, socket}
  end
def handle_out("user_joined", msg, socket) do
  if User.ignoring?(socket.assigns[:user], msg.user_id) do
    {:reply, :ok, socket}
  else
    push socket, "user_joined", msg
   {:reply, :ok, socket}
  end
end
end
