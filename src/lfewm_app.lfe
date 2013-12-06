(defmodule lfewm_app
  (export (start 2) (stop 1)))

(defun start (type, start_args)
  (: lfewm_sup start_link))

(defun stop (state)
  'ok)
