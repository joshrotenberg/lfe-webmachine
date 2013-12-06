(defmodule lfewm_resource
  (include-lib "webmachine/include/webmachine.hrl")
  (export (init 1))
  (export (ping 2))
  (export (to_html 2)))

;; i think we need this because it doesn't get parsed from the .hrl ...
(defun ping (req_data state)
  (tuple 'pong req_data state))

(defun init (args)
  #(ok undefined))

(defun to_html (req_data state)
  (tuple '"<html><body> Hello, LFE</body></html>" req_data state))
