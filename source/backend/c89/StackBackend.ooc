
import structs/Stack, C89Ast

StackBackend: class {

    stack := Stack<CNode> new()

    push: func (o: CNode) {
        stack push(o)
    }

    peek: func <T> (T: Class) -> T {
        o := stack peek()
	    if(!o instanceOf?(T)) {
    	    Exception new("Expected " + T name + ", peek'd " + o class name)
    	}
	    o
    }

    pop: func <T> (T: Class) -> T {
    	o := stack pop()
	    if(!o instanceOf?(T)) {
    	    Exception new("Expected " + T name + ", pop'd " + o class name)
    	}
    	o
    }

}
