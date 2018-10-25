import unittest
import lca

class TestLca(unittest.TestCase):

    # def test_node4_5(self):
    #     self.assertEqual(lca.findLCA(lca.root, 4, 5).key, 2)
    #
    # def test_node6_2(self):
    #     self.assertEqual(lca.findLCA(lca.root, 6, 2).key, 1)
    #
    # def test_node_none(self):
    #     self.assertEqual(lca.findLCA(None, 4, 5), None)
    #
    # def test_node1_5(self):
    #     self.assertEqual(lca.findLCA(lca.root, 1, 5).key, 1)
    #
    # def test_node_same(self):
    #     self.assertEqual(lca.findLCA(lca.root, 1, 1).key, 1)
    #
    # def test_node2_3(self):
    #     self.assertEqual(lca.findLCA(lca.root, 2, 3).key, 1)
    #
    # def test_node6_7(self):
    #     self.assertEqual(lca.findLCA(lca.root, 6, 7).key, 3)
    #
    # def test_node_fake(self):
    #     self.assertEqual(lca.findLCA(lca.root, 8, 8), None)

#test cases for DAG

    def test_node1_3(self):
        self.assertEqual(lca.dagLCA(lca.root, lca.root.key, lca.r3.key).key, 1)

    def test_node_None(self):
        self.assertEqual(lca.dagLCA(None, 1, 3), None)

    def test_node3_1(self):
        self.assertEqual(lca.dagLCA(lca.root, 3, 1).key, 1)

    def test_node2_3(self):
        self.assertEqual(lca.dagLCA(lca.root, lca.r2, lca.r3), 1)

    def test_node5_4(self):
        self.assertEqual(lca.dagLCA(lca.root, lca.r5, lca.r4), 3)

    def test_node4_3(self):
        self.assertEqual(lca.dagLCA(lca.root, lca.r4, lca.r3), 1)

    def test_node5_2(self):
        self.assertEqual(lca.dagLCA(lca.root, lca.r5, lca.r2), 1)

    def test_node6_5(self):
        self.assertEqual(lca.dagLCA(lca.root, lca.r6, lca.r5), 4)

    def test_node6_3(self):
        self.assertEqual(lca.dagLCA(lca.root, lca.r6, lca.r3), 1)

    def test_node6_4(self):
        self.assertEqual(lca.dagLCA(lca.root, lca.r6, lca.r4), 4)

    def test_node_same(self):
        self.assertEqual(lca.dagLCA(lca.root, lca.r6, lca.r6), 6)

if __name__ == '__main__':
    unittest.main()
