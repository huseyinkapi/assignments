//
//  MojiLala_PlayGround_Project_Q1
//  Question 1
//
//  Created by Hüseyin Kapi on 18/08/17.
//


public class Node {
    var value: Int
    var leftChild: Node!
    var rightChild: Node!
    
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
        node.leftChild = nil
        node.rightChild = nil
        
        return node
    }
}


/*
    The method that accepts a single Node as an argument and returns whether the tree starting at that node is a binary search tree.
 */
func isBinarySearchTree(root: Node!) -> Bool{
    return isBST_tool(root: root, min: Int.min, max: Int.max)
}


func isBST_tool(root: Node!, min: Int, max: Int)->Bool {
    /*if the tree is empty, then it is binary search tree*/
    if(root==nil){
        return true
    }
    
    /*
     To be valid binary search tree, the value of left child node should be lower than the value of parent node AND the value of the right child node should be higher than the value of parent node.
     */
    if(root.value<min || root.value>max){
        return false
    }
    
    
    let first_Condition: Bool  = isBST_tool(root: root.leftChild, min: min, max: root.value)
    
    let second_Condition: Bool  = isBST_tool(root: root.rightChild, min: root.value, max: max)
    
    
    if(first_Condition && second_Condition){
        return true
    }else{
        return false
    }
    
    
}


/*These are the entries to see whether the "sample_tree" is binary search tree or not. */

let sample_tree = Node(value: 12)
sample_tree.leftChild = sample_tree.addNode(value: 6)
sample_tree.rightChild = sample_tree.addNode(value: 13)
sample_tree.leftChild.leftChild = sample_tree.addNode(value: 4)
sample_tree.leftChild.rightChild = sample_tree.addNode(value: 8)


if(isBinarySearchTree(root: sample_tree)){
    print("This is Binary Search Tree")
}else{
    print("NOT Binary Search Tree")
}


