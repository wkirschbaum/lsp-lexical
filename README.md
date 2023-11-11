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
