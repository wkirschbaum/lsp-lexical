;;; lsp-lexical.el --- Lexical client for lsp-mode -*- lexical-binding: t; -*-

;; Copyright (C) 2023 Wilhelm H Kirschbaum

;; Author           : Wilhelm H Kirschbaum
;; Version          : 1.0
;; URL              : https://github.com/wkirschbaum/lsp-lexical
;; Package-Requires : ((emacs "29.1") (lsp-mode "8.0.1"))
;; Created          : November 2023
;; Keywords         : elixir languages

;;  This program is free software: you can redistribute it and/or modify
;;  it under the terms of the GNU General Public License as published by
;;  the Free Software Foundation, either version 3 of the License, or
;;  (at your option) any later version.

;;  This program is distributed in the hope that it will be useful,
;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;  GNU General Public License for more details.

;;  You should have received a copy of the GNU General Public License
;;  along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; LSP Client for the Elixir Lexical language server.

;;; Code:

(require 'lsp-mode)

(defgroup lsp-lexical nil
  "Settings for the lexical language server."
  :group 'lsp-mode
  :link '(url-link "https://github.com/lexical-lsp/lexical"))

(defcustom lsp-lexical-version "0.4.1"
  "Lexical language server version to download.
It has to be set before `lsp-lexical.el' is loaded and it has to
be available here: https://github.com/lexical-lsp/lexical/releases/."
  :type 'string
  :group 'lsp-lexical)

(defcustom lsp-lexical-download-url
  (format (concat "https://github.com/lexical-lsp/lexical"
                  "/releases/download/v%1$s/lexical-v%1$s.zip")
          lsp-lexical-version)
  "Automatic download url for `lexical'."
  :type 'string
  :group 'lsp-lexical
  :package-version '(lsp-mode . "8.0.1"))

(defcustom lsp-lexical-binary-path
  (f-join lsp-server-install-dir "lexical" "lexical" "bin" "start_lexical.sh")
  "The path to the `lexical' binary."
  :type 'file
  :group 'lsp-lexical)

(lsp-dependency
 'lexical
 `(:download :url lsp-lexical-download-url
             :decompress :zip
             :store-path ,(f-join lsp-server-install-dir "lexical" "lexical.zip")
             :binary-path lsp-lexical-binary-path
             :set-executable? t))

(lsp-register-client
 (make-lsp-client
  :new-connection (lsp-stdio-connection
                   (lambda ()
                     (or (executable-find
                          lsp-lexical-binary-path)
                         (lsp-package-path 'lexical))))
  :activation-fn (lsp-activate-on "elixir")
  :priority 0
  :add-on? nil
  :multi-root nil
  :server-id 'lexical
  :download-server-fn
  (lambda (_client callback error-callback _update?)
    (lsp-package-ensure 'lexical callback error-callback))))

(lsp-consistency-check lsp-lexical)

(provide 'lsp-lexical)

;;; lsp-lexical.el ends here
