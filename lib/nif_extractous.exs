defmodule NifExtractous do
  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :nif_extractous,
    crate: "nif_extractous",
    base_url:
      "https://github.com/snewcomer/nif-extractous/releases/download/v#{version}",
    force_build: System.get_env("EXTRACTOUS_BUILD") in ["1", "true"],
    version: version

  def extract_document(_path), do: :erlang.nif_error(:nif_not_loaded)
end
