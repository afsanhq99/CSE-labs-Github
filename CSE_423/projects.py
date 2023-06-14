from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *
import math
import numpy as np


############################
### Find Zone Algorithm  ###
############################
def findZone(x0, y0, x1, y1):

    dy = y1-y0
    dx = x1-x0

    if abs(dx) > abs(dy):   # Represents zone 0, 3, 4, 7.
        if dx > 0 and dy > 0:
            # print("FindZone: 0")
            return 0
        elif dx < 0 and dy > 0:
            # print("FindZone: 3")
            return 3
        elif dx < 0 and dy < 0:
            # print("FindZone: 4")
            return 4
        else:
            # print("FindZone: 7")
            return 7

    else:                   # Represents zone 1, 2, 5, 6.
        if dx > 0 and dy > 0:
            # print("FindZone: 1")
            return 1
        elif dx < 0 and dy > 0:
            # print("FindZone: 2")
            return 2
        elif dx < 0 and dy < 0:
            # print("FindZone: 5")
            return 5
        else:
            # print("FindZone: 6")
            return 6
# ============================================================

#######################################
### Zone Zero Conversion Algorithm  ###
#######################################


def ZoneZeroConversion(zone, x, y):

    if zone == 0:
        # print("Zone Zero Conversion Executed:", x, ",", y)
        return x, y
    elif zone == 1:
        # print("Zone Zero Conversion Executed:", y, ",", x)
        return y, x
    elif zone == 2:
        # print("Zone Zero Conversion Executed:", -y, ",", x)
        return -y, x
    elif zone == 3:
        # print("Zone Zero Conversion Executed:", -x, ",", y)
        return -x, y
    elif zone == 4:
        # print("Zone Zero Conversion Executed:", -x, ",", -y)
        return -x, -y
    elif zone == 5:
        # print("Zone Zero Conversion Executed:", -y, ",", -x)
        return -y, -x
    elif zone == 6:
        # print("Zone Zero Conversion Executed:", -y, ",", x)
        return -y, x
    elif zone == 7:
        # print("Zone Zero Conversion Executed:", x, ",", -y)
        return x, -y
# -----------------------------------------------------------
#########################################
### Zero to Original zone Algorithm ###
########################################


def zero_to_original_zone(zone, x, y):

    if zone == 0:
        # print("Converted to original zone:", x, ",", y)
        return x, y
    if zone == 1:
        # print("Converted to original zone:", y, ",", x)
        return y, x
    if zone == 2:
        # print("Converted to original zone:", -y, ",", -x)
        return -y, -x
    if zone == 3:
        # print("Converted to original zone:", -x, ",", y)
        return -x, y
    if zone == 4:
        # print("Converted to original zone:", -x, ",", -y)
        return -x, -y
    if zone == 5:
        # print("Converted to original zone:", -y, ",", -x)
        return -y, -x
    if zone == 6:
        # print("Converted to original zone:", y, ",", -x)
        return y, -x
    if zone == 7:
        # print("Converted to original zone:", x, ",", -y)
        return x, -y
# -----------------------------------------------------------
#########################################
### Mid Point Line Drawing Algorithm ###
########################################


def MidPointLine(zone, x0, y0, x1, y1):

    dy = y1-y0
    dx = x1-x0
    d_init = 2*dy - dx
    e = 2*dy
    ne = 2*(dy-dx)

    x = x0
    y = y0

    while x <= x1:

        # Converting the points to the original zone and then drawing it
        a, b = zero_to_original_zone(zone, x, y)
        draw_points(a, b)
        # print("point drawn")

        if d_init <= 0:
            x += 1
            d_init += e

        else:
            x += 1
            y += 1
            d_init += ne
# -----------------------------------------------------------
# This is the control centre from where the whole eight way symmetry algorithm is executed.


def eight_way_symmetry(x0, y0, x1, y1):
    zone = findZone(x0, y0, x1, y1)
    z0_x0, z0_y0 = ZoneZeroConversion(zone, x0, y0)
    z0_x1, z0_y1 = ZoneZeroConversion(zone, x1, y1)
    MidPointLine(zone, z0_x0, z0_y0, z0_x1, z0_y1)
    # print("Task finished!")
    # print("=================================================================")
    # print()
# -----------------------------------------------------------


# This function is basically used to colour the background.
def BackGroundColour():
    for i in range(500):
        eight_way_symmetry(0, i, 500, i)

# -----------------------------------------------------------


def building1():
    for i in range(250):
        eight_way_symmetry(0, i, 100, i)


def building2():
    for i in range(150):
        eight_way_symmetry(106, i, 300, i)
    # glColor3f(0.6, 0.9, 0.9)
    for i in range(40):
        eight_way_symmetry(160, i, 240, i)


def building3():
    for i in range(200):
        eight_way_symmetry(306, i, 350,  i)


def building4():
    for i in range(230):
        eight_way_symmetry(350, i, 400, i)


def building5():
    for i in range(280):
        eight_way_symmetry(406, i, 500, i)


def building2_entry():
    for i in range(40):
        eight_way_symmetry(160, i, 240, i)


def eightWay(x, y, x0, y0):
    draw_points(x + x0, y + y0)
    draw_points(y + x0, x + y0)
    draw_points(y + x0, -x + y0)
    draw_points(x + x0, -y + y0)
    draw_points(-x + x0, -y + y0)
    draw_points(-y + x0, -x + y0)
    draw_points(-y + x0, x + y0)
    draw_points(-x + x0, y + y0)


def midPoint(x0, y0, radius):
    d = 1 - radius
    x = 0
    y = radius
    eightWay(x, y, x0, y0)
    while x < y:
        if d >= 0:
            d = d + 2 * x - 2 * y + 5
            x = x + 1
            y = y - 1
        else:
            d = d + 2 * x + 3
            x = x + 1
        eightWay(x, y, x0, y0)


def draw_circle(x, y, radius):
    # big circle
    midPoint(x, y, radius)

    glutSwapBuffers()


# -----------------------------------------------------------
# This function is used to draw pixels.
def draw_points(x, y):
    # The parameter that is passed in the function dictates the size of the pixel.
    glPointSize(5)

    glBegin(GL_POINTS)

    # Think of this as a co-ordinate. At the given x and y position the pixel will be drawn.
    glVertex2f(x, y)

    glEnd()


def iterate():
    glViewport(0, 0, 500, 500)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    glOrtho(0.0, 500, 0.0, 500, 0.0, 1.0)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()


def showScreen():
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glLoadIdentity()
    iterate()
    a = math.cos(math.radians(45))
    b = math.sin(math.radians(45))
    r = np.array([[a, -b, 0],
                  [b, a, 0],
                  [0, 0, 1]])

    sc = 0.5
    s = np.array([[sc, 0, 0],
                  [0, sc, 0],
                  [0, 0, 1]])

    rs = np.matmul(r, s)

    v1 = np.array([[.2],
                   [.2],
                   [1]])
    v2 = np.array([[-.2],
                   [.2],
                   [1]])
    v3 = np.array([[-.2],
                   [-.2],
                   [1]])
    v4 = np.array([[.2],
                   [-.2],
                   [1]])

    # rotation
    # v11 = np.matmul(r,v1)
    # v22 = np.matmul(r,v2)
    # v33 = np.matmul(r,v3)
    # v44 = np.matmul(r,v4)

    # scaling
    # v11 = np.matmul(s,v1)
    # v22 = np.matmul(s,v2)
    # v33 = np.matmul(s,v3)
    # v44 = np.matmul(s,v4)

    # rotation - scaling
    v11 = np.matmul(rs, v1)
    v22 = np.matmul(rs, v2)
    v33 = np.matmul(rs, v3)
    v44 = np.matmul(rs, v4)

    glColor3f(1, 0, 0)
    glBegin(GL_QUADS)
    glVertex2f(v11[0][0], v11[1][0])
    glVertex2f(v22[0][0], v22[1][0])
    glVertex2f(v33[0][0], v33[1][0])
    glVertex2f(v44[0][0], v44[1][0])
    glEnd()

    # (Red, Green, Blue)
    ### ============================###
    ### call_the_draw_methods_here ###
    ### ============================###
    # glColor3f(0.0, 0.5, 1.0)
    # BackGroundColour()
    # ------------------------
    glColor3f(0.0, 0.5, 1.0)
    BackGroundColour()

    glColor3f(0.7, 0.0, 0.0)
    x = float(input("ENTER THE INPUT: "))

    for i in range(45, 0, -1):
        if (x >= 1 and x < 2):
            draw_circle(200, 250, i)
        elif (x >= 2 and x < 3):
            draw_circle(200, 300, i)
        elif (x >= 3 and x < 4):
            draw_circle(200, 330, i)
        elif (x >= 4 and x < 5):
            draw_circle(200, 380, i)
        elif (x >= 5 and x < 6):
            draw_circle(200, 400, i)
        elif (x >= 6 and x < 7):
            draw_circle(200, 420, i)
        elif (x >= 7 and x < 8):
            draw_circle(200, 430, i)
        elif (x >= 8 and x < 9):
            draw_circle(200, 450, i)
        elif (x >= 9 and x < 9):
            draw_circle(200, 470, i)
        elif (x >= 10 and x < 11):
            draw_circle(200, 480, i)

    building1()
    building2()
    building3()
    building4()
    building5()

    glColor3f(1.0, 1.0, 1.0)
    building2_entry()

    glutSwapBuffers()


glutInit()
glutInitDisplayMode(GLUT_RGBA)

# Size of the window.
# Manipulating this value will let us change the size of the output widow where the pixel is shown. If values here are changed, then it also need to be changed in line number 192 and 195.
glutInitWindowSize(500, 500)

glutInitWindowPosition(0, 0)

# window name
wind = glutCreateWindow(b"Project_CSE423")

glutDisplayFunc(showScreen)

glutMainLoop()
