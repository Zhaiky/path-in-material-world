import math

# Inputing the values of variables and their absolute error
L = raw_input("L:")
L = float(L)
eL = float(0.00002)
A1 = raw_input("A1:")
A1 = float(A1)
eA1 = float(0.5)
A2 = raw_input("A2:")
A2 = float(A2)
eA2 = float(0.5)
g = 9.81

# Step one - division
temp1 = (A1/A2)
temp1_e = (A1/A2)*(((eA1/A1)**2+(eA2/A2)**2)**0.5)

# Step two - natural log of Step one
temp2 = math.log(temp1,2.7182818285)
temp2_e = temp1_e/(temp1*math.log(2.7182818285,2.7182818285))

# Step three - multiply by 1/15
temp3 = temp2/5
temp3_e = (temp2/5)*(temp2_e/temp2)
1209
# Step four - 2pi divided by ...
temp4 = 2*math.pi/temp3
temp4_e = 2*math.pi*(temp3_e/temp3)

# Step five - squaring by itself
temp5 = temp4**2
temp5_e = (temp4**2)*(((temp4_e/temp4)*2)**0.5)

# Step six - addition with 1
temp6 = temp5+1
temp6_e = temp5_e

# Step seven - square root
temp7 = temp6**0.5
temp7_e = 0.5*(temp6**(-0.5))*temp6_e

# Step eight - 1 divided by ...
temp8 = 1/temp7
temp8_e = (1/temp7)*(temp7_e/temp7)

# Step nine - error of g/L
temp9 = 9.81/L
temp9_e = (9.81/L)*(eL/L)

# Step ten - error of sqrt(g/L)
temp10 = temp9**0.5
temp10_e = 0.5*(temp9**(-0.5))*temp9_e

# Final
part_a = temp8 * temp10
part_b = temp8*temp10*(((temp8_e/temp8)**2+(temp10_e/temp10)**2)**0.5)

part_c = 2 * part_a
part_d = 2 * part_a * (part_b/part_a)

print "y_star Value: %s" % part_c
print "y_star Error: %s" % part_d


