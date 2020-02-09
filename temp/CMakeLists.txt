# If the pyx file is a C++ file, we should specify that here.

# skbuild
# rect.pyx
add_cython_target(rect CXX)
# add_library(rect ${rect})
add_library(rect MODULE ${rect} Rectangle.cxx)
# target_link_libraries(rect ${EXTERNAL_PKG_LIBRARIES})
python_extension_module(rect)
# python_extension_module(rect
#                         LINKED_MODULES_VAR linked_module_list
#                         FORWARD_DECL_MODULES_VAR fdecl_module_list)
#install(TARGETS rect LIBRARY DESTINATION ${PROJECT_SOURCE_DIR}/temp)
install(TARGETS rect LIBRARY DESTINATION temp)

# pi_calculator.pyx
# add_cython_target(pi_calculator pi_calculator.pyx)
add_cython_target(pi_calculator CXX)
# add_library(pi_calculator MODULE ${pi_calculator})
add_library(pi_calculator MODULE ${pi_calculator} PiCalculator.cxx)
# target_link_libraries(pi_calculator ${EXTERNAL_PKG_LIBRARIES})
python_extension_module(pi_calculator)
# python_extension_module(pi_calculator
#                         LINKED_MODULES_VAR linked_module_list
#                         FORWARD_DECL_MODULES_VAR fdecl_module_list)
#install(TARGETS pi_calculator LIBRARY DESTINATION ${PROJECT_SOURCE_DIR}/temp)
install(TARGETS pi_calculator LIBRARY DESTINATION temp)