import sys

table = [ 1, 1, 1, 1, 1, 1, 1, 1, 
          2, 2, 2, 2, 2, 2, 2, 2, 
          3, 3, 3, 3, 3, 3, 3, 3, 
          4, 4, 4, 4, 4, 4, 4, 4, 
          5, 5, 5, 5, 5, 5, 5, 5, 
          6, 6, 6, 6, 6, 6, 6, 6, 
          7, 7, 7, 7, 7, 7, 7, 7,
		  8, 8, 8, 8, 8, 8, 8, 8]

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

