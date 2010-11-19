import middle/Resolver
import Type, Expression, Scope, Statement

If: class extends Expression {

    expr: Expression { get set }
    body := Scope new()
    _type: Type
    getType: func -> Type { _type }
    setType: func (=_type) {}

    init: func(=expr) {}

    resolve: func(task: Task) {
        task queue(expr)
        task queue(body)

        // auto-return of the poor people
        list := body body
        last := list last()
        if (last instanceOf?(Expression)) {
            _type = last as Expression getType()
        }
    }

    add: func(s: Statement) {
        body add(s)
    }
}
