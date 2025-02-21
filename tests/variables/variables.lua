print("\n=====Start test assignment=====")
local a = 1
print("a = " .. a)
a = a + 1
print("a = a + 1, a = " .. a)
a = a - 1
print("a = a - 1, a = " .. a)
a = a * 2
print("a = a * 2, a = " .. a)
a = a / 2
print("a = a / 2, a = " .. a)
a = 7
a = a % 4
print("a = 7, a = a %% 4, a = " .. a)

print("\n=====Start test operator=====")
local b = 1
print("b = " .. b)
b = b + 1
print("b += 1, b = " .. b)
b = b - 1
print("b -= 1, b = " .. b)
b = b * 2
print("b *= 2, b = " .. b)
b = b / 2
print("b /= 2, b = " .. b)
b = 7
b = b % 4
print("b = 7, b %%= 4, b = " .. b)

print("\n=====Start arithmetic=====")
print("23+5 = " .. (23 + 5) .. " (wait 28)")
print("3*4 = " .. (3 * 4) .. " (wait 12)")
print("22-(6-4) = " .. (22 - (6 - 4)) .. " (wait 20)")
print("22/(6/3) = " .. (22 / (6 / 3)) .. " (wait 11)")
print("1+(5-2)*4/(2+1) = " .. (1 + (5 - 2) * 4 / (2 + 1)) .. " (wait 5)")
print("0+(1+23)/4*5*67-8+9 = " .. (0 + (1 + 23) / 4 * 5 * 67 - 8 + 9) .. " (wait 2011)")
print("192/(3*8+4*(33/5))-5 = " .. (192 / (3 * 8 + 4 * (33 / 5)) - 5) .. " (wait -1)")