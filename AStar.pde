import java.util.Collections ;

public class AStarSearch {
  // Graph represented as an array. This will make querying adjacent nodes easy.
  private AStarNode[][] graph ;
  // The open list, from which we will pluck the next node at each iteration
  private ArrayList<AStarNode>open ;
  
  // The constructor takes in the game map and builds the graph
  public AStarSearch(int[][] map) {
    graph = new AStarNode[map.length][] ;
    for (int row = 0; row < map.length; row++) {
      graph[row] = new AStarNode[map[row].length] ;
      for (int col = 0; col < map[row].length; col++) {
        if (map[row][col]!=1)
          graph[row][col] = new AStarNode(row, col) ;
        else 
          graph[row][col] = null ;
      }
    }    
  }
  
  // resets ready for a new search. Avoids lots of object reconstruction
  private void reset() {
    for (int row = 0; row < graph.length; row++) {    
      for (int col = 0; col < graph[row].length; col++) {
        if (graph[row][col] != null)
          graph[row][col].reset() ;
      }    
    }
  }  
  
  // Process a node adjacent to the current node
  private void process(AStarNode curr, AStarNode node, int currRow, int currCol, int goalRow, int goalCol, int newCost) {
    // if node is null then there was a wall in the visited direction
    if (node == null) return ;
    // if node is closed nothing to do
    if (node.isClosed()) return ;
    // We've been here before
    if (node.isVisited()) {
      if (node.getCost() > newCost) {
        node.setCost(newCost) ;
        node.setPrevNode(curr) ;
      }
    }
    // This node was unvisited
    else {
      node.setCost(newCost) ;
      node.makeEstimate(goalRow, goalCol) ;
      node.setPrevNode(curr) ;
      node.setVisited() ;
      open.add(node) ;
    }     
  }
  
  // returns true if goal node is the first thing on the open list
  // Otherwise processes adjacent nodes
  private boolean searchIteration(int goalRow, int goalCol) {
    Collections.sort(open) ;
    AStarNode currentNode = open.remove(0) ;
    // if this is the goal node we are done.    
    if (currentNode.hasCoords(goalRow, goalCol))
      return true ;
    // Iterate over reachable nodes.
    int currRow = currentNode.getRow() ;
    int currCol = currentNode.getCol() ;
    int newCost = currentNode.getCost() + 1 ;
    if(currRow > 0){
      process(currentNode, graph[currRow-1][currCol], currRow, currCol, goalRow, goalCol, newCost) ;
    }
    if(currRow < 15){
      process(currentNode, graph[currRow+1][currCol], currRow, currCol, goalRow, goalCol, newCost) ;
    }
    if(currCol < 11){
      process(currentNode, graph[currRow][currCol+1], currRow, currCol, goalRow, goalCol, newCost) ;
    } 
    if(currCol > 0){
      process(currentNode, graph[currRow][currCol-1], currRow, currCol, goalRow, goalCol, newCost) ;
    }
    // This node now done and can be closed  
    currentNode.close() ; 
    return false ;
  }
  
  // Extract path by tracing the prevNode fields of AStarNode
  private ArrayList<AStarNode> extractPath(int sourceRow, int sourceCol, int goalRow, int goalCol) {
    ArrayList<AStarNode>path = new ArrayList<AStarNode>() ;
    AStarNode currNode = graph[goalRow][goalCol] ;
    do {
      path.add(currNode) ; 
      currNode = currNode.getPrevNode() ;
    } while (currNode != null) ;
    return path ;
  }
  
  // Start the A* search for a path between the specified points
  public ArrayList<AStarNode> search(int sourceRow, int sourceCol, int goalRow, int goalCol) {
    reset() ;
    // initialise the open list
    open = new ArrayList<AStarNode>() ;
    open.add(graph[sourceRow][sourceCol]) ;
    if( graph[sourceRow][sourceCol] != null){
       graph[sourceRow][sourceCol].setCost(0) ;
    }
    // Continue until the open list is empty (which may indicate failure), or the goal is the first thing on open
    while(!open.isEmpty()) {
      if (searchIteration(goalRow, goalCol)) {
        return extractPath(sourceRow, sourceCol, goalRow, goalCol) ;
      }
    }
    return null ;
  }  
}

public class AStarNode implements Comparable<AStarNode> {
  // The cost of shortest path found so far to here, and the estimate to the goal
  private int cost = 0, estimate = 0;
  // Coordinates in original map
  private int row, col ;
  // During A* search the node from which we arrived here
  private AStarNode prevNode ;
  // Book keeping for A*. Visited could be determined by membership of open list, but this is cheaper.
  private boolean visited, closed = false ;
  
  public AStarNode(int row, int col) {
    this.row = row ;
    this.col = col ;
  }
  
  // reset to avoid reconstruction
  public void reset() {
    cost = 0 ;
    estimate = 0 ;
    prevNode = null ;
    visited = false ;
    closed = false ;
  }  
  
  // Getters and setters
  public void setCost(int inCost) {cost = inCost ;}
  public int getCost() {return cost ;}
  public int getTotalCost() {return cost + estimate ;}

  public int getRow() {return row ;}
  public int getCol() {return col ;}

  public void close() {closed = true ;}
  public boolean isClosed() {return closed ;}
  
  public void setVisited() {visited = true ;}
  public boolean isVisited() {return visited ;}
  
  public boolean hasCoords(int inRow, int inCol) {
    return row == inRow && col == inCol ; 
  }
  
  // For building the path
  public void setPrevNode(AStarNode node) {prevNode = node ;}
  public AStarNode getPrevNode() {return prevNode ;}
  
  // Calculate estimate to goal. Manhattan distance
  public void makeEstimate(int goalRow, int goalCol) {
    estimate = Math.abs(goalRow - row) + Math.abs(goalCol - col) ; 
  }
  
  // implements comparable interface for sorting the open list
  int compareTo(AStarNode inNode) {
    return cost + estimate - inNode.getTotalCost() ; 
  }
}
