require "queue_classic"

Sequel.migration do
  up do
    QC::Setup.create
  end

  down do
    QC::Setup.drop
  end
end
