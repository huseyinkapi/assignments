//
//  MojiLala_PlayGround_Project_Q2
//  Question 2
//
//  Created by Hüseyin Kapi on 18/08/17.
//

public class Node {
    var value: Int
    var next: Node!
    
    init(value: Int) {
        self.value = value
    }
}


extension Node {
    /*
     Add a new node to the root of tree.
     */
    public func addNode(value: Int) ->Node{
        
        let node = Node(value: value)
        node.value = value
        node.next = nil
        
        return node
    }
}



/*
 The method that accepts a single Node as an argument and returns whether the linkedlist starting at that node contains a cycle */
func isContainCycle(node: Node!) -> Bool{
    
    var visitedArray: Array<Node> = Array()
    var nodeX = node!
    
    // An empty linked list means it is cyclic
    if (nodeX == nil){
        return true
    }
    
    /*Store each node in linkedlist to an array. And then for each loop look if any node contains in that array. If any node is visited before, it means that the linkedlist will looping.*/
    while nodeX != nil && nodeX.next != nil {
        
        visitedArray.append(nodeX)
        
        for anynode in visitedArray{
            if(anynode===nodeX.next){
                return true
            }
        }
        
        nodeX = nodeX.next
    }
    return false
}


/*These are the entries to see whether the "sample_linkedlist" contains a cycle or not. */

let sample_linkedlist = Node(value: 12)
sample_linkedlist.next = sample_linkedlist.addNode(value: 6)
sample_linkedlist.next.next = sample_linkedlist.addNode(value: 13)
sample_linkedlist.next.next.next = sample_linkedlist.addNode(value: 4)
sample_linkedlist.next.next.next.next = sample_linkedlist.addNode(value: 8)
sample_linkedlist.next.next.next.next.next = sample_linkedlist


if(isContainCycle(node: sample_linkedlist)){
    print("The linked list contains a cycle")
}else{
    print("The linked list NOT contain a cycle")
}