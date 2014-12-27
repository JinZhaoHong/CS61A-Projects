;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Snaaaaaaaake.
;;;
;;; Description:
;;;   Snake recursive snake
;;;   Recursive snake recursive
;;;   snake, snake, snake! 

(define (repeat n func) ; Repeat func n times.
  (if (> n 1)
      (begin (func) (repeat (- n 1) func))
      (func)))

(define (triangle)  ; a 2D triangle
	(speed 0)
	(color "red")
	(repeat 3   
	          (lambda () (fd 25) (rt 120)(fd 25) )
		))

(define (triangle_3D)  ; a 3D triangle 
	(repeat 1
		(lambda() (triangle) (rt 90) (penup) (fd 50) (pendown) (lt 90) (triangle) 
			(fd 25) (lt 90) (fd 50) (lt 150) (fd 50) (lt 30) (fd 50) (rt 150) (fd 50) (rt 30) (fd 50))
		))

(define (building_blocks_t)  ; 5 adjacent 3D triangles
	  (repeat 5
	   (lambda () (penup) (rt 90) (fd 75) (pendown) (triangle_3D))))

(define (rectangle_3D)  ; a 3D rectangle
	(speed 20)
    (color "black")
    (repeat 4
    	(lambda () (fd 50)(rt 90)))
    (repeat 1
    	(lambda () (rt 135) (fd 50) (lt 135)))
    (repeat 4
    	(lambda () (fd 50) (rt 90)))
    (repeat 1
    	 (lambda () (fd 50) (lt 45) (fd 50) (rt 135) (fd 50)  (rt 45) (fd 50)  (rt 45) (fd 50) (rt 135) (fd 50)))

   )

(define (building_blocks_r) ; a roll of 5 rectangles
	(repeat 5
	     (lambda() (rectangle_3D)  (rt 45))) 
	(repeat 1  (lambda() (lt 90) (fd 250) (rt 90) (fd 50) ))
)

(define (flat_surface)  ; a surface of rectangles
	(repeat 2
		(lambda() (building_blocks_r))
		))


(define (zigzag) 
	(repeat 5  (lambda() (flat_surface) (repeat 1   (lambda() (penup) (rt 180) (fd 50) (rt 135) (fd 50) (rt 45 ) (pendown))) )))

(define (draw)
  ; *YOUR CODE HERE*
  (building_blocks_t)
	(repeat 1
		(lambda() (lt 90) (penup) (fd 200) (lt 90) (fd 50) (rt 90) (fd 35) (rt 90) (fd 35) (pendown))
		)
	(zigzag)    
  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.  All Scheme tokens in this file (including the one below) count
; toward the token limit.
(draw)
