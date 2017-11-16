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
	repeats = dict()
	for word in str.split(" "):
		for k, v in combinations(word, 4).iteritems():
			repeats[k] = repeats.get(k, 0) + v

	total = reduce(lambda a, b: a+b, repeats.itervalues(), 0)

	print dict(map(lambda (k, v): (k, 100.0* v/total), repeats.iteritems()))
