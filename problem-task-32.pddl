(define (problem waiting-32)
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
        B - broom
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

        ;; Agent starts at BUFF
        (At Agent BUFF)

        (not (Served C)) 
        (At C LB)

        (At P BUFF)
        (not (hasFood P))

        (At B UB)

        (hasBrokenPlate MF)
        (isDirty MF)
        (hasBrokenPlate MB)
        (isDirty MB)
        (isDirty UF)

    )
    
    (:goal
        (and
            (isServed C)
            (At Agent BUFF)
            (not (isDirty MF))
            (not (isDirty MB))
            (not (isDirty UF))
            (not (isDirty LB))
            (not (isDirty UB))
            (not (isDirty LF))
            (not (isDirty BUFF))
            


        )
        

    )
)