(defmodule lfewm_sup
  (export (start_link 0) (upgrade 0))
  (export (init 1)))

(defun start_link ()
  (: supervisor start_link (tuple 'local 'lfewm_sup) 'lfewm_sup (list)))

(defun upgrade ()) ;; TODO

(defun init (args)
  (let* (
	 ( ip (case (: os getenv '"WEBMACHINE_IP") ('false '"0.0.0.0") (any any)) )
	 ( (tuple ok app) (: application get_application 'lfewm_sup) )
	 ( (tuple ok dispatch) (: file consult (: filename join (list (priv_dir app) '"dispatch.conf"))) )
	 ( port (case (: os getenv '"WEBMACHINE_PORT") ('false 8080) (any any)) )
	 ( web_config (list
		       (tuple 'ip ip)
		       (tuple 'port port)
		       (tuple 'log_dir '"priv/log")
		       (tuple 'dispatch dispatch)) )
	 ( web (tuple 'webmachine_mochiweb
		      (tuple 'webmachine_mochiweb 'start (list web_config))
		      'permanent 5000 'worker (list 'mochiweb_socket_server)) )
	 ( processes (list web) ) )
    (tuple ok (tuple (tuple 'one_for_one 10 10) processes))))

(defun priv_dir (mod)
  (case (: code priv_dir mod)
    ((tuple error bad_name) (let ( (ebin (: filename dirname (: code which mod) )))
			      (: filename join (: filename dirname ebin) '"priv")))
    (privdir privdir)))

