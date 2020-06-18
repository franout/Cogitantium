TEST=True
import DTPU_delegate.py


def test_sum():
	print("start testing dtpu delegate.py")
	assert sum([1,2,3])== 6 ,"should be 6"
if __name__== "__main__":
	test_sum()
	print("TEST PASSED FOR PYTHON CODE")