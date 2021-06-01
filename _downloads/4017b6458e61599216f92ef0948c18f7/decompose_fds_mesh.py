import sys
import re

input_raw_mesh = sys.argv[1]
input_raw_decomposition = sys.argv[2]

print("raw input mesh: {}".format(input_raw_mesh))
print("raw input decomposition: {}".format(input_raw_decomposition))

raw_ijk = re.findall(r"IJK=\d+,\d+,\d+", input_raw_mesh)[0]
print("raw ijk: {}".format(raw_ijk))
ijk_str = re.findall(r"\d+", raw_ijk)
ijk = [int(ijk_str[0]), int(ijk_str[1]), int(ijk_str[2])]
print("i: {}, j: {}, k: {}".format(ijk[0], ijk[1], ijk[2]))

re_float = "[-+]?[0-9]*\.?[0-9]+"
raw_xb = re.findall(r"XB={0},{0},{0},{0},{0},{0}".format(re_float), input_raw_mesh)[0]
print("raw xb: {}".format(raw_xb))
xb_str = re.findall(r"{}".format(re_float), raw_xb)
x = [float(xb_str[0]), float(xb_str[1])]
y = [float(xb_str[2]), float(xb_str[3])]
z = [float(xb_str[4]), float(xb_str[5])]
print("x: {},{}".format(x[0], x[1]))
print("y: {},{}".format(y[0], y[1]))
print("z: {},{}".format(z[0], z[1]))

dec_str = re.findall(r'\d+', input_raw_decomposition)
dec = [int(dec_str[0]), int(dec_str[1]), int(dec_str[2])]
print("decomposition: {}, {}, {}".format(dec[0], dec[1], dec[2]))

lx = x[1] - x[0]
dx = lx / dec[0]
di = ijk[0] // dec[0]
if di * dec[0] != ijk[0]:
    print("ERROR: x-decomposition does not match: {} * {} = {} != {}".format(di, dec[0], di*dec[0], ijk[0]))
print("lx: {}, dx: {}, di: {}".format(lx, dx, di))

ly = y[1] - y[0]
dy = ly / dec[1]
dj = ijk[1] // dec[1]
if dj * dec[1] != ijk[1]:
    print("ERROR: y-decomposition does not match: {} * {} = {} != {}".format(dj, dec[1], dj*dec[1], ijk[1]))
print("ly: {:.4f}, dy: {:.4f}, dj: {}".format(ly, dy, dj))

lz = z[1] - z[0]
dz = lz / dec[2]
dk = ijk[2] // dec[2]
if dk * dec[2] != ijk[2]:
    print("ERROR: z-decomposition does not match: {} * {} = {} != {}".format(dk, dec[2], dk*dec[2], ijk[2]))
print("lz: {:.4f}, dz: {:.4f}, dk: {}".format(lz, dz, dk))

print("resulting number of meshes: {}".format(dec[0] * dec[1] * dec[2]))

print("===========================")

mid = 0
for ix in range(dec[0]):
    for iy in range(dec[1]):
        for iz in range(dec[2]):
            mid += 1
            x1 = x[0] + ix*dx
            x2 = x[0] + (ix+1)*dx
            y1 = y[0] + iy*dy
            y2 = y[0] + (iy+1)*dy
            z1 = z[0] + iz*dz
            z2 = z[0] + (iz+1)*dz
            print("&MESH ID='{}' IJK={},{},{} XB={:.4f},{:.4f},{:.4f},{:.4f},{:.4f},{:.4f} /".format(mid, di, dj, dk, x1, x2, y1, y2, z1, z2))
