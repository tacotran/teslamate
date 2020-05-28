defmodule TeslaMate.Repo.Migrations.CostByMinute do
  use Ecto.Migration

  alias TeslaMate.Locations.GeoFence.BillingType

  def change do
    BillingType.create_type()

    alter table(:geofences) do
      add(:billing_type, BillingType.type(), null: false, default: "per_kwh")
    end

    rename table(:geofences), :cost_per_kwh, to: :cost_per_unit
  end
end
