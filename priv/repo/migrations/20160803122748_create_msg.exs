defmodule Chatto.Repo.Migrations.CreateMsg do
  use Ecto.Migration

  def change do
    create table(:msgs) do
      add :body, :text
      add :user_id, references(:users, on_delete: :nothing)
      add :username, references(:users, on_delete: :nothing)

      timestamps
    end
    create index(:msgs, [:user_id])
    create index(:msgs, [:username])

  end
end
