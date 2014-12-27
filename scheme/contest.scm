;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Your title here>
;;;
;;; Description:
;;;   <It's your masterpiece.
;;;    Use these three lines to describe
;;;    its inner meaning.>
(define (draw)
	(circle_draw)
	(rt 90)
	(building_blocks_t)
	(repeat 1
		(lambda() (lt 90) (penup) (fd 200) (lt 90) (fd 50) (rt 90) (fd 35) (rt 90) (fd 35) (pendown))
		)
	(zigzag)
	)    

(define (repeat n func) ; Repeat func k times.
  (if (> n 1)
      (begin (func) (repeat (- n 1) func))
      (func)))

(define (five_star)
	(speed 0)
	(color "Blue")
	(begin_fill)
  (repeat 5
    (lambda () (fd 25) (repeat 5 (lambda () (fd 10) (rt 144))) (rt 144)))
  (end_fill)
     )

(define (circle_draw)   
	(speed 0)
	(color "red")
	(begin_fill)
	(repeat 1
		(lambda () (circle 100) ))
	(end_fill)

	)

(define (flag)
	(speed 0)
	(color "red")
	(begin_fill)
	(repeat 1
		(lambda() (lt 180)(fd 1000) (rt 90) (fd 1000) (rt 90) (fd 1000) (rt 90) (fd 1000)))
	(end_fill)

	)

(define (triangle)
	(speed 0)
	(color "black")
	(repeat 3   
	          (lambda () (fd 25) (rt 120)(fd 25) )
		))

(define (triangle_3D) 
	(repeat 1
		(lambda() (triangle) (rt 90) (penup) (fd 50) (pendown) (lt 90) (triangle) 
			(fd 25) (lt 90) (fd 50) (lt 150) (fd 50) (lt 30) (fd 50) (rt 150) (fd 50) (rt 30) (fd 50))
		))


(define (building_blocks_t)  
	  (repeat 5
	   (lambda () (penup) (rt 90) (fd 75) (pendown) (triangle_3D))))



(define (rectangle_3D) 
    (speed 5)
    (color "black")
    (repeat 4
    	(lambda () (fd 100)(rt 90)))
    (repeat 1
    	(lambda () (rt 135) (fd 100) (lt 135)))
    (repeat 4
    	(lambda () (fd 100) (rt 90)))
    (repeat 1
    	 (lambda () (fd 100) (lt 45) (fd 100) (rt 135) (fd 100)  (rt 45) (fd 100)  (rt 45) (fd 100) (rt 135) (fd 100)))

   )

(define (rectangle_3D_half)
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

(define (building_blocks)
	(repeat 5
	     (lambda() (rectangle_3D_half)  (rt 45))) 
	(repeat 1  (lambda() (lt 90) (fd 250) (rt 90) (fd 50) ))
)

(define (flat_surface) 
	(repeat 5 
		(lambda() (building_blocks)))

	  )

(define (flat_surface_a) 
	(repeat 2
		(lambda() (building_blocks))


	  ))
(define (flat_surface_b) 
	(repeat 1 
		(lambda() (building_blocks))

	  ))

(define (cube) 
    (repeat 3  (lambda() (flat_surface) (repeat 1   (lambda() (penup) (rt 180) (fd 250) (rt 135) (fd 50) (rt 45 ) (pendown))) ))
    (repeat 3  (lambda() (flat_surface_a) (repeat 1   (lambda() (penup) (rt 180) (fd 150) (rt 135) (fd 50) (rt 45 ) (pendown))) ))
    (repeat 3  (lambda() (flat_surface_b) (repeat 1   (lambda() (penup) (rt 180) (fd 50) (rt 135) (fd 50) (rt 45 ) (pendown))) ))
    )

(define (zigzag)
	(repeat 5  (lambda() (flat_surface_a) (repeat 1   (lambda() (penup) (rt 180) (fd 50) (rt 135) (fd 50) (rt 45 ) (pendown))) )))

; Please leave this last line alone.  You may add additional procedures above
; this line.  All Scheme tokens in this file (including the one below) count
; toward the token limit.
(draw)