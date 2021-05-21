defmodule ChatAPIWeb.RoomChannel do
  use Phoenix.Channel

  def join("room:" <> room_id, _params, socket) do
    IO.inspect(socket.assigns.user_token)
    {:ok, %{"roomId" => room_id}, socket}
  end

  def handle_in("new_message", payload, socket) do
    broadcast!(socket, "new_message", payload)
    {:reply, {:ok, payload}  , socket}
  end
end
