defmodule NifExtractous do
  use RustlerPrecompiled,
    otp_app: :radiant_intel,
    crate: "doc_extractor",
    base_url:
      "https://github.com/philss/rustler_precompilation_example/releases/download/v#{version}",
    force_build: System.get_env("RUSTLER_PRECOMPILATION_EXAMPLE_BUILD") in ["1", "true"],
    version: "0.0.1"

  def extract_document(_path), do: :erlang.nif_error(:nif_not_loaded)
end
