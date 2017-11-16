#!/usr/bin/env python

import sys

def combinations(data, size):
	c = dict()
	if len(data) >= size:
		for size in xrange(size, len(data)+1):
			for i in xrange(0, len(data) - size + 1):
#				print(len(data), size, i, data[i: i+size])
				line = data[i: i+size]
				c[line] = c.get(line, 0) + 1
	return c
	

if __name__ == "__main__":
	str = sys.argv[1]
	for word in str.split(" "):
		print combinations(word, 4)
