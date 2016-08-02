ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Chatto.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Chatto.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Chatto.Repo)

