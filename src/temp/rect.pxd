from c_rectangle cimport Rectangle as CRectangle
cimport c_rectangle

cdef class Rectangle:
    cdef c_rectangle.Rectangle *thisptr  # hold a C++ instance which we're wrap
    cpdef getLength(self)
    cpdef getHeight(self)
    cpdef getArea(self)
    cpdef move(self, dx, dy)
