# Unit tests for sedsed

import unittest
import sys
import os

# Make ../sedsed.py importable
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import sedsed

# Mock to avoid the print() call from the original
sedsed.fatal_error = lambda msg: sys.exit(msg)

class TestSedsed(unittest.TestCase):

    def test_read_file_not_found(self):
        with self.assertRaises(SystemExit):
            sedsed.read_file('404.txt')

    def test_read_file_ok(self):
        output = sedsed.read_file(__file__)
        self.assertEqual(output[0], '# Unit tests for sedsed')

    def test_write_file_use_dir(self):
        with self.assertRaises(SystemExit):
            some_dir = os.path.dirname(__file__)
            sedsed.write_file(some_dir, ['line1'])

    def test_write_file_ok(self):
        temp_file = __file__ + '.tmp'
        sedsed.write_file(temp_file, ['line1'])
        self.assertTrue(os.path.isfile(temp_file))
        os.remove(temp_file)

if __name__ == '__main__':
    unittest.main()