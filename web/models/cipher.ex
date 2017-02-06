defmodule Cipherapp.Caesar do
  use Cipherapp.Web, :model

  schema "caesar" do
    field :text, :string
    field :shift, :integer
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:text, :shift])
    |> validate_required([:text, :shift])
  end

end
