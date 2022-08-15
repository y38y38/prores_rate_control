import sys

table = [ 1, 2, 3, 4, 5, 6, 7, 8,
          1, 2, 3, 4, 5, 6, 7, 8,
          1, 2, 3, 4, 5, 6, 7, 8,
          1, 2, 3, 4, 5, 6, 7, 8,
          1, 2, 3, 4, 5, 6, 7, 8,
          1, 2, 3, 4, 5, 6, 7, 8,
          1, 2, 3, 4, 5, 6, 7, 8,
          1, 2, 3, 4, 5, 6, 7, 8,]

start_val = int(sys.argv[1])
diff_val = int(sys.argv[2])

#print( start_val , diff_val)
for i in range(8):
	for j in range(8):
		num = table[(i*8)+j]
		val = start_val + (diff_val * (num - 1))
		if (val > 63):
			val = 63
		print (val, end=',')
	print ("")

