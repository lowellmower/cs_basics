# there are two types of graphs, directed and undirected. An
# undirected graph is one in which the nodes ( V or verticies )
# are directionless by way in which they point to a neighboring
# node. Given the example below of an undirected graph, the
# edges would be E = { {0,1} {1,2} {2,3} {3,0}} and the order
# in which these edges are listed does not matter.

#  0-----1    <= an exaple of an undirected graph
#  |     |
#  |     |
#  3-----2

# one might write an adjacencey list for this undirected graph
# as such:

#   nodes | neighrbor set
#     0   |  1,3
#     1   |  0,2
#     2   |  3,1
#     3   |  0,2

# one can generate an adjacencey matrix to represent the list
# by creating an nxn matrix where n=v, so in the case of this
# graph our matrix would be 4x4.

# adjacencey matrix:   given the matrix (A) we can plot the
#      0 1 2 3         coordinates of an edge with 1/0 given
#   0 [0|1|0|1]        the positions i,j so the A[i,j] == 1
#   1 [ |0| | ]        is the affirmative of an edge between
#   2 [ | |0| ]        two nodes.
#   3 [ | | |0]
