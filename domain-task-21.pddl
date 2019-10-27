(define (domain waiting)
    (:requirements :adl )
    
    (:types
        waiter
        location
        customer
        plate
    )
    
    (:constants 
        ;; You should not need to add any additional constants
        Agent - waiter
        BUFF - location
    )
    
    (:predicates
        (Holding ?a - waiter ?p - plate)
        (Adjacent ?x - location ?y - location)
        (hasFood ?p - plate)
        (isServed ?c - customer)
        (At ?x - object ?r - location)
    )
    
    (:action Pick-Up
        :parameters (?a - waiter ?r - location ?p - plate)
        :precondition (and
            (not (Holding ?a ?p))
            (not (hasFood ?p))
            (At ?a ?r)
            (At ?p ?r)
        )
        :effect (and
            (Holding ?a ?p)
            (not (At ?p ?r))
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
        )
        :effect (and
            (not (At ?a ?from))
            (At ?a ?to)
        )
    )



)