# Lexical client for lsp-mode

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

## Installation

```elisp
(use-package lsp-mode
  :ensure t
  :hook ((elixir-ts-mode . lsp-deferred)
         (heex-ts-mode . lsp-deferred)
         (elixir-mode . lsp-deferred))
  :commands (lsp lsp-deferred)
  :config
  (load "~/[path to repo]/lsp-lexical.el"))
```

Install the server by running `M-x lsp-install-server` and choose
`lexical`.

To update the lexical server version you can run `M-x customize-group`
and select `lsp-lexical`.  After updating the version ensure to re-run
the server installation command.

It is also possible to set the binary path or the download link via the
customization group.
