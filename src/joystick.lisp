(in-package #:sdl2)

(defun joystick-update ()
  (sdl-joystick-update))

(defun joystick-count ()
  (check-rc (sdl-numjoysticks)))

(defun joystick-opened (device-index)
  ;; TODO this is documented in the wiki but doesn't seem to be
  ;; generated by c2ffi. Perhaps it's not released yet?
  (check-rc (sdl-joystickopened device-index)))

(defun joystick-open (device-index)
  (sdl-collect
   (check-null (sdl2-ffi::sdl-joystickopen device-index))
   (lambda (j) (sdl-joystick-close j))))

(defun joystick-close (joystick)
  (sdl-joystickclose joystick)
  (sdl-cancel-collect joystick))

(defun joystick-name-for-index (device-index)
  (check-null (sdl-joysticknameforindex device-index)))

(defun joystick-name (joystick)
  (check-null (sdl-joystickname joystick)))

(defmacro joystick-caps-query (fn joystick)
  `(check-rc (,fn ,joystick)))

(defun joystick-hat-count (joystick)
  (joystick-caps-query sdl-joysticknumhats joystick))

(defun joystick-axis-count (joystick)
  (joystick-caps-query sdl-joysticknumaxes joystick))

(defun joystick-ball-count (joystick)
  (joystick-caps-query sdl-joysticknumballs joystick))

(defun joystick-button-count (joystick)
  (joystick-caps-query sdl-joysticknumbuttons joystick))



