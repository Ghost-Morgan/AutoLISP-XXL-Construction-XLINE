(defun c:XXL (/ oldLayer oldColor xlLayerName xlColor olderr)
  ;; ---- CONFIGURE ----
  (setq xlLayerName "XL-LINES")
  (setq xlColor 8)
  ;; -------------------

  (setq oldLayer (getvar "CLAYER"))
  (setq oldColor (getvar "CECOLOR"))

  ;; Save the current error handler, install our own that guarantees cleanup
  (setq olderr *error*)
  (defun *error* (msg)
    (setvar "CLAYER" oldLayer)
    (setvar "CECOLOR" oldColor)
    (setq *error* olderr)
    (if (not (member msg '("Function cancelled" "quit / exit abort")))
      (princ (strcat "\nError: " msg))
    )
    (princ)
  )

  ;; Make (create-if-missing, switch-to) the XL layer, force its color
  (command "._-LAYER" "_M" xlLayerName "_C" xlColor "" "")
  (setvar "CECOLOR" (itoa xlColor))

  ;; Launch real XLINE â€” H/V/A/B/O and Shift-click ortho pass straight through
  (command "._XLINE")
  (while (> (getvar "CMDACTIVE") 0)
    (command pause)
  )

  ;; Normal completion path: restore, then restore the error handler itself
  (setvar "CLAYER" oldLayer)
  (setvar "CECOLOR" oldColor)
  (setq *error* olderr)
  (princ)
)
(princ "\nXXL loaded â€” type XXL, then H/V/A/B/O as usual, Shift-click for ortho override.")
(princ)