defmodule TeslaMate.Repo.Migrations.RenameUnitEnums do
  use Ecto.Migration

  def change do
    execute("ALTER TYPE public.length RENAME TO unit_of_length", &rollback_warning/0)
    execute("ALTER TYPE public.temperature RENAME TO unit_of_temperature", &rollback_warning/0)
  end

  defp rollback_warning, do: raise("cannot rollback renaming unit enum")
end
