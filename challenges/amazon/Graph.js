#!/usr/bin/env node

// https://www.geeksforgeeks.org/implementation-graph-javascript/

const Queue = require('./Queue.js')

class Graph {
	constructor(verticesNumber) {
		this.verticesNumber = verticesNumber;
		this.adjList = new Map();
	}
	addVertex(v) {
		this.adjList.set(v, []);
	}
	addEdge(v, w) {
		this.adjList.get(v).push(w);
		this.adjList.get(w).push(v);
	}
	printGraph() {
		const vertices = this.adjList.keys();
		for (const vertex of vertices) {
			let res = '';
			const adjacentVertices = this.adjList.get(vertex);
			for (const j of adjacentVertices) {
				res += j + ' ';
			}
			console.log(vertex + ' -> ' + res);
		}
	}
	bfs(startingNode) {
	    const visited = {};
	    const q = new Queue();

	    visited[startingNode] = true;
	    q.enqueue(startingNode);

	    while (!q.isEmpty()) {
	        const getQueueElement = q.dequeue();
	        console.log(getQueueElement);

	        const getList = this.adjList.get(getQueueElement);

	        // loop through the list and add the element to the
	        // queue if it is not processed yet
	        for (const i in getList) {
	            const neigh = getList[i];
	  
	            if (!visited[neigh]) {
	                visited[neigh] = true;
	                q.enqueue(neigh);
	            }
	        }
	    }
	}
	DFSUtil(vert, visited) {
	    visited[vert] = true;
	    console.log(vert);
	  
	    const get_neighbours = this.AdjList.get(vert);
	  
	    for (const i in get_neighbours) {
	        const get_elem = get_neighbours[i];
	        if (!visited[get_elem])
	            this.DFSUtil(get_elem, visited);
	    }
	}
	dfs(startingNode) {
	    const visited = {};
	    this.DFSUtil(startingNode, visited);
	}
}

const g = new Graph(6);
var vertices = [ 'A', 'B', 'C', 'D', 'E', 'F' ];
  
// adding vertices
for (var i = 0; i < vertices.length; i++) {
    g.addVertex(vertices[i]);
}

g.addEdge('A', 'B');
g.addEdge('A', 'D');
g.addEdge('A', 'E');
g.addEdge('B', 'C');
g.addEdge('D', 'E');
g.addEdge('E', 'F');
g.addEdge('E', 'C');
g.addEdge('C', 'F');
g.bfs('A');
// g.printGraph();
