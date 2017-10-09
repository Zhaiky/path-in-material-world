import math

m = 0.05
em = 0.001
L = raw_input("L:") # value of L
L = float(L)
eL = 0.00002        # error of L
print type(L)

# Step 1 squaring L
temp1 = L**2
etemp1 = 2*(L**(-0.5))*eL

# Step 2 multiplying with m
temp2 = m*temp1
etemp2 = m*temp1*(etemp1/temp1)

# Step 3 1 divide by ...
temp3 = 1/temp2
etemp3 = (1/temp2)*(etemp2/temp2)

print "x_star Value: %s" % temp3
print "x_star Error: %s" % etemp3

