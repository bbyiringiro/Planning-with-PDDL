(define (domain waiting)
    (:requirements :adl )
    
    (:types
        waiter
        location
        customer
        plate
        broom
        food
    )
    
    (:constants 
        ;; You should not need to add any additional constants
        Agent - waiter
        BUFF - location
    )
    
    (:predicates
        (Adjacent ?x - location ?y - location)
        (hasFood ?p - plate)
        (isServed ?c - customer)
        (At ?x - object ?r - location)
        (Holding ?a - waiter ?pb - object) ;;pb for plate or broom
        (HoldingSomething ?a - waiter)
        (isDirty ?r - location) 
        (hasBrokenPlate ?r - location)
        ;; a region is dirty either if it has some broken plates or other dropped food or both
    )
    
    (:action Pick-Up
        :parameters (?a - waiter ?r - location ?pb - object)
        :precondition (and
            (not (Holding ?a ?pb))
            (not (HoldingSomething ?a))
            (At ?a ?r)
            (At ?pb ?r)
        )
        :effect (and
            (Holding ?a ?pb)
            (HoldingSomething ?a)
            (not (At ?pb ?r))
        )
    )
    
    (:action Hand-Over
        :parameters (?a - waiter ?r - location ?p - plate ?c - customer)
        :precondition (and
            (Holding ?a ?p)
            (At ?a ?r)
            (At ?c ?r)
            (hasFood ?p)
        )
        :effect (and
            (not (Holding ?a ?p))
            (not (HoldingSomething ?a))
            (isServed ?c)
        )
    )
    
    (:action Fill
        :parameters (?a - waiter ?p - plate)
        :precondition (and
            (Holding ?a ?p)
            (not (hasFood ?p))
            (At ?a BUFF)
        )
        :effect (hasFood ?p)
    )
    
    (:action Move
        :parameters (?a - waiter ?from - location ?to - location)
        :precondition (and
            (At ?a ?from)
            (not (= ?from ?to))
            (Adjacent ?from ?to)
            (not (hasBrokenPlate ?to))
        )
        :effect (and
            (not (At ?a ?from))
            (At ?a ?to)
        )
    )
    (:action Sweep-Up
        :parameters (?a - waiter ?from - location ?to - location ?b - broom)
        :precondition (and
            (Holding ?a ?b)
            (isDirty ?to)
            (At ?a ?from)
            (Adjacent ?from ?to)
        )
        :effect (and
            (not (isDirty ?to))
            (not (hasBrokenPlate ?to))

        )
    )
    (:action Put-Down
        :parameters (?a - waiter ?r - location ?pb - object)
        :precondition (and
            (Holding ?a ?pb)
            (At ?a ?r)
        )
        :effect (and
            (not (Holding ?a ?pb))
            (not (HoldingSomething ?a))
        )
    )

)