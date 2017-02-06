defmodule Cipherapp.PageController do
  use Cipherapp.Web, :controller

  alias Cipherapp.Caesar


  def index(conn, _params) do
    changeset = Caesar.changeset(%Caesar{}, %{})

    render conn, "index.html", changeset: changeset
  end

  def create(conn, %{"caesar" => cipher}) do
    IO.puts ">>>>>>>>>>> #{inspect cipher}"
    %{"text" => msg, "shift" => shift} = cipher

    {shift, _} = Integer.parse(shift)
    encryption = Cipherapp.Encrypt.encrypt(msg, shift)

    render conn, "display.html", encryption: encryption
    # case Repo.insert(changeset) do
    #   {:ok, _topic} ->
    #     conn
    #     |> put_flash(:info, "Topic Created")
    #     |> redirect(to: topic_path(conn, :index))
    #   {:error, changeset} ->
    #     render conn, "new.html", changeset: changeset
    # end
  end

  def show(conn, _params) do
    encryption = "string"
    render conn, "display.html", encryption: encryption
  end
end
