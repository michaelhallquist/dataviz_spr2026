output_dir <- Sys.getenv("QUARTO_PROJECT_OUTPUT_DIR")
if (output_dir == "") {
  stop("QUARTO_PROJECT_OUTPUT_DIR is not set.")
}

copy_qmds <- function(src_dir) {
  if (!dir.exists(src_dir)) {
    return(invisible(NULL))
  }

  qmds <- list.files(src_dir, pattern = "\\.qmd$", recursive = TRUE, full.names = TRUE)
  qmds <- qmds[!grepl(paste0("^", src_dir, "[/\\\\]downloads[/\\\\]"), qmds)]

  if (length(qmds) == 0) {
    return(invisible(NULL))
  }

  rel_paths <- sub(paste0("^", src_dir, "[/\\\\]"), "", qmds)
  output_dest_paths <- file.path(output_dir, src_dir, "downloads", rel_paths)
  dir.create(unique(dirname(output_dest_paths)), recursive = TRUE, showWarnings = FALSE)
  file.copy(qmds, output_dest_paths, overwrite = TRUE)
}

copy_qmds("materials")
copy_qmds("assignments")
