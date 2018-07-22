XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
C
C  Cylindrical layers - distances all in cm
0000000000000000000000000000000000000000000000000000000000000000
SURFACE (   1)   Plane Z=0 - surface plane
INDICES=( 0, 0, 0, 1, 0)
0000000000000000000000000000000000000000000000000000000000000000
SURFACE (   2)   Plane Z=-250 nm (1st film, 250 nm thick)
INDICES=( 0, 0, 0, 1, 0)
Z-SHIFT=(-2.500000000000000E-05,   0)

0000000000000000000000000000000000000000000000000000000000000000
SURFACE (   3)   Plane Z=-400 nm (2nd film, 150 nm thick)
INDICES=( 0, 0, 0, 1, 0)
Z-SHIFT=(-4.000000000000000E-05,   0)
0000000000000000000000000000000000000000000000000000000000000000
SURFACE (   4)   Plane Z=-1 cm (3rd material, Bulk)
INDICES=( 0, 0, 0, 1, 0)
Z-SHIFT=(-1.000000000000000E+00,   0)
0000000000000000000000000000000000000000000000000000000000000000
SURFACE (   5)   Cylinder, 1 cm radius
INDICES=( 1, 1, 0, 0,-1)
X-SCALE=(+1.000000000000000E+00,   0)              (DEFAULT=1.0)
Y-SCALE=(+1.000000000000000E+00,   0)              (DEFAULT=1.0)
0000000000000000000000000000000000000000000000000000000000000000
BODY    (   1)   top Layer
MATERIAL(   1)
SURFACE (   1), SIDE POINTER=(-1)
SURFACE (   2), SIDE POINTER=( 1)
SURFACE (   5), SIDE POINTER=(-1)
0000000000000000000000000000000000000000000000000000000000000000
BODY    (   2)   middle Layer
MATERIAL(   2)
SURFACE (   2), SIDE POINTER=(-1)
SURFACE (   3), SIDE POINTER=( 1)
SURFACE (   5), SIDE POINTER=(-1)
0000000000000000000000000000000000000000000000000000000000000000
BODY    (   3)   bottom Layer
MATERIAL(   3)
SURFACE (   3), SIDE POINTER=(-1)
SURFACE (   4), SIDE POINTER=( 1)
SURFACE (   5), SIDE POINTER=(-1)
0000000000000000000000000000000000000000000000000000000000000000
END      0000000000000000000000000000000000000000000000000000000
