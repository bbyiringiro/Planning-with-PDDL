(define (problem waiting-23) ;; Replace XX with task number
    (:domain waiting)
    (:objects 
        BUFF - location
    	UF - location
    	UB - location
    	MB - location
    	LB - location
    	LF - location
    	MF - location
    	
    	P1 - plate
    	C1 - customer

    	P2 - plate
    	C2 - customer
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
        
        ;; Empty plate at MB
        (At P1 MB)
        (not (hasFood P1))
        
        ;; Empty plate at LB
        (At P2 LB)
        (not (hasFood P2))
        
        ;; Both customers: one at UB, one at LF
        (At C1 UB)
        (At C2 LF)
    )
    
    (:goal (and
    
        ;; goal is that both customers are served,
        (isServed C1)
        (isServed C2)
        
        ;; and the agent is at the BUFF
        (At Agent BUFF)
    ))
)