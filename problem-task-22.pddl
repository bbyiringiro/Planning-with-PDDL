(define (problem waiting-22)
    (:domain waiting)
    (:objects 
    	BUFF - location
    	UF - location
    	UB - location
    	MB - location
    	LB - location
    	LF - location
    	MF - location
    	
    	P - plate
    	C - customer
    )
    
    (:init
    	(Adjacent BUFF UF)
		(Adjacent UF BUFF)
		(Adjacent UF UB)
		(Adjacent UF MF)
		(Adjacent UB UF)
		(Adjacent MF UF)
		(Adjacent UB MB)
		(Adjacent MB UB)
		(Adjacent MF LF)
		(Adjacent LF MF)
		(Adjacent MB LB)
		(Adjacent LB MB)
		(Adjacent LB LF)
		(Adjacent LF LB)

		;; Agent starts at MF
		(At Agent MF)


		;; Empty plate at BUFF
		(At P BUFF)
		(not (hasFood P))

		;; Customer C is not served
		(not (isServed C))

		;; Customer C is at LB
		(At C LB)

    )
    
    (:goal
    	(isServed C)
    )
)

