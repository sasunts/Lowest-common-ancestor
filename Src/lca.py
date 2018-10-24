class Node:

    def __init__(self, key):
        self.key = key
        self.pred = []
        self.succ = []

# def findLCA(root, n1, n2):
#
#     if root is None:
#         return None
#
#     if root.key == n1 or root.key == n2:
#         return root
#
#     left_lca = findLCA(root.left, n1, n2)
#     right_lca = findLCA(root.right, n1, n2)
#
#     if left_lca and right_lca:
#         return root
#
#     return left_lca if left_lca is not None else right_lca

def dagLCA(root,n1,n2):

    if root is None:
        return None

    if root.key == n1 or root.key == n2:
        return root




root = Node(1)
r2 = Node(2)
r3 = Node(3)
r4 = Node(4)
r5 = Node(5)
root.succ = [r2,r3,r4,r5]
r2.succ = [r4]
r2.pred = [root]
r3.succ = [r4, r5]
r3.pred = [root]
r4.succ = [r5]
r4.pred = [r2,r3,root]
r5.pred = [r3,r4,root]

#binary tree nodes
# root = Node(1)
# root.left = Node(2)
# root.right = Node(3)
# root.left.left = Node(4)
# root.left.right = Node(5)
# root.right.left = Node(6)
# root.right.right = Node(7)
