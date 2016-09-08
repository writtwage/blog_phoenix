defmodule BlogPhoenix.Post do
  use BlogPhoenix.Web, :model

  schema "posts" do
    field :title, :string
    field :body, :string

    # NOTE again, adding this because each post has many comments
    has_many :comments, BlogPhoenix.Comment

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body])
    |> validate_required([:title, :body])
  end
end
