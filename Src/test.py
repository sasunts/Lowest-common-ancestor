import unittest
import lca

class TestLca(unittest.TestCase):

    def test_node4_5(self):
        self.assertEqual(lca.findLCA(lca.root, 4, 5).key, 2)

    def test_node6_2(self):
        self.assertEqual(lca.findLCA(lca.root, 6, 2).key, 1)

    def test_node_none(self):
        self.assertEqual(lca.findLCA(None, 4, 5), None)

#TODO: Add more tests 

if __name__ == '__main__':
    unittest.main()
