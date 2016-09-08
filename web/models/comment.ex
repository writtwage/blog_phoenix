defmodule BlogPhoenix.Comment do
  use BlogPhoenix.Web, :model

  schema "comments" do
    field :name, :string
    field :content, :string
     #NOTE added foreign_key as instructed by the guide
    belongs_to :post, BlogPhoenix.Post, foreign_key: :post_id

    timestamps()
  end

  # NOTE following lines included in guide code but are not mentioned in
  # instructions
  # @required_fields ~w(name content post_id)
  # @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  # NOTE need to clarify what changeset does/is
  def changeset(struct, params \\ %{}) do
    struct
    # NOTE in the guide, this is done with @
    |> cast(params, [:name, :content, :post_id])
    |> validate_required([:name, :content, :post_id])
  end
end
