

import middle/Resolver
import Type, Expression

Var: class extends Expression {

    _type: Type
    name: String { get set }
    expr: Expression { get set }

    init: func (=name) {}

    setType: func (=_type) {}

    getType: func -> Type {
        _type
    }

    resolve: func (task: Task) {
        if(!_type) {
            task queue(expr)
            _type = expr getType()
            if(!_type)
                Exception new("Couldn't resolve type of " + toString()) throw()
        }

        task queue(type)
    }

    toString: func -> String {
        name + (type ? ": " + type toString() : " :") + (expr ? "= " + expr toString() : "")
    }

}

