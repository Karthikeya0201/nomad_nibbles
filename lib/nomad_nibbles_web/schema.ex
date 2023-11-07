defmodule NomadNibblesWeb.Schema do
  use Absinthe.Schema

  import_types(NomadNibblesWeb.Schema.Types)

  query do
    import_fields(:food_permit)
  end
end
