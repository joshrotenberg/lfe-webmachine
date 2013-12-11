(defmodule lfewm_resource
  (export (init 1))
  (export (ping 2))
  (export (to_html 2)))

(include-lib "webmachine/include/webmachine.hrl")

;; rvirding updated lfe to pull in functions from a .hrl, but we still
;; need the export above for now.
;;(defun ping (req_data state)
;;  (tuple 'pong req_data state))

(defun init (args)
  (tuple 'ok 'undefined))

(defun to_html (req_data state)
  (tuple '"<html><body> Hello, LFE</body></html>" req_data state))
