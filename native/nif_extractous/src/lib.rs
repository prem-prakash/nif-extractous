use extractous::{Extractor, PdfParserConfig, PdfOcrStrategy};
use rustler::NifResult;

#[rustler::nif(schedule = "DirtyCpu")]
fn extract_document(path: String) -> NifResult<(String, String)> {
    let extractor = Extractor::new();

    match extractor.extract_file_to_string(&path) {
        Ok((content, metadata)) => Ok((content, format!("{:?}", metadata))),
        Err(e) => Err(rustler::Error::Term(Box::new(format!("Extraction failed: {}", e))))
    }
}

#[rustler::nif(schedule = "DirtyCpu")]
fn extract_document_ocr(path: String) -> NifResult<(String, String)> {
    let extractor = Extractor::new()
        .set_ocr_config(TesseractOcrConfig::new())
        .set_pdf_config(
            PdfParserConfig::new().set_ocr_strategy(PdfOcrStrategy::OCR_AND_TEXT_EXTRACTION).set_extract_inline_images(false).set_extract_unique_inline_images_only(false),
        );

    match extractor.extract_file_to_string(&path) {
        Ok((content, metadata)) => Ok((content, format!("{:?}", metadata))),
        Err(e) => Err(rustler::Error::Term(Box::new(format!("Extraction failed: {}", e))))
    }
}

rustler::init!("Elixir.NifExtractous.Native");