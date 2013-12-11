(defmodule lfewm_resource
  (export (init 1))
  (export (to_html 2)))

(include-lib "webmachine/include/webmachine.hrl")

(defun init (args)
  (tuple 'ok 'undefined))

(defun to_html (req_data state)
  (tuple '"<html><body> Hello, LFE</body></html>" req_data state))
