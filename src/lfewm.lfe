(defmodule lfewm
  (export (ensure_started 1))
  (export (start 0) (start_link 0) (stop 0)))

(defun ensure_started (app)
  (case (: application start app)
    ('ok 'ok)
    ((tuple 'error (tuple 'already_started app)) 'ok)))

(defun start_link ()
  (ensure_started 'inets)
  (ensure_started 'crypto)
  (ensure_started 'mochiweb)
  (: application set_env 'webmachine 'webmachine_logger_module 'webmachine_logger)
  (ensure_started 'webmachine)
  (: lfewm_sup start_link))

(defun start ()
  (ensure_started 'inets)
  (ensure_started 'crypto)
  (ensure_started 'mochiweb)
  (: application set_env 'webmachine 'webmachine_logger_module 'webmachine_logger)
  (ensure_started 'webmachine)
  (: application start 'lfewm))

(defun stop ()
  (let ( (res (: application stop 'lfewm)))

    (: application stop 'webmachine)
    (: application stop 'mochiweb)
    (: application stop 'crypto)
    (: application stop 'inets)
    res))

