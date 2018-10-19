import unittest
import lca

class TestLca(unittest.TestCase):

    def test_node4_5(self):
        self.assertEqual(lca.findLCA(lca.root, 4, 5).key, 2)

if __name__ == '__main__':
    unittest.main()
