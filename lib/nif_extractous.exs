defmodule NifExtractous do
  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :radiant_intel,
    crate: "doc_extractor",
    base_url:
      "https://github.com/snewcomer/nif-extractous/releases/v#{version}",
    force_build: System.get_env("RUSTLER_PRECOMPILATION_EXAMPLE_BUILD") in ["1", "true"],
    version: version

  def extract_document(_path), do: :erlang.nif_error(:nif_not_loaded)
end
