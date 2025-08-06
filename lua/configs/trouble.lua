return {
  modes = {
    diagnostics = {
      mode = "diagnostics",
      warn_no_results = false,
      open_no_results = true,
      preview = {
        type = "split",
        relative = "win",
        position = "right",
        size = 0.3,
      },
    },
    lsp = {
      warn_no_results = false,
      open_no_results = true,
      win = {
        mode = "float",
        relative = "win",
        position = "right",
        width = 0.3,
        height = 1.0,
      },
      sections = {
        "lsp_document_symbols",
        "lsp_definitions",
        "lsp_references",
        "lsp_implementations",
        "lsp_type_definitions",
        "lsp_declarations",
        "lsp_incoming_calls",
        "lsp_outgoing_calls",
      },
    },
  },
}
