# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "aces_car: 2 messages, 0 services")

set(MSG_I_FLAGS "-Iaces_car:/home/nvidia/catkin_ws/src/aces_car/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(aces_car_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/nvidia/catkin_ws/src/aces_car/msg/intersection.msg" NAME_WE)
add_custom_target(_aces_car_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "aces_car" "/home/nvidia/catkin_ws/src/aces_car/msg/intersection.msg" ""
)

get_filename_component(_filename "/home/nvidia/catkin_ws/src/aces_car/msg/esc_signal.msg" NAME_WE)
add_custom_target(_aces_car_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "aces_car" "/home/nvidia/catkin_ws/src/aces_car/msg/esc_signal.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(aces_car
  "/home/nvidia/catkin_ws/src/aces_car/msg/intersection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/aces_car
)
_generate_msg_cpp(aces_car
  "/home/nvidia/catkin_ws/src/aces_car/msg/esc_signal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/aces_car
)

### Generating Services

### Generating Module File
_generate_module_cpp(aces_car
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/aces_car
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(aces_car_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(aces_car_generate_messages aces_car_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/catkin_ws/src/aces_car/msg/intersection.msg" NAME_WE)
add_dependencies(aces_car_generate_messages_cpp _aces_car_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/catkin_ws/src/aces_car/msg/esc_signal.msg" NAME_WE)
add_dependencies(aces_car_generate_messages_cpp _aces_car_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(aces_car_gencpp)
add_dependencies(aces_car_gencpp aces_car_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS aces_car_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(aces_car
  "/home/nvidia/catkin_ws/src/aces_car/msg/intersection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/aces_car
)
_generate_msg_eus(aces_car
  "/home/nvidia/catkin_ws/src/aces_car/msg/esc_signal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/aces_car
)

### Generating Services

### Generating Module File
_generate_module_eus(aces_car
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/aces_car
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(aces_car_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(aces_car_generate_messages aces_car_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/catkin_ws/src/aces_car/msg/intersection.msg" NAME_WE)
add_dependencies(aces_car_generate_messages_eus _aces_car_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/catkin_ws/src/aces_car/msg/esc_signal.msg" NAME_WE)
add_dependencies(aces_car_generate_messages_eus _aces_car_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(aces_car_geneus)
add_dependencies(aces_car_geneus aces_car_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS aces_car_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(aces_car
  "/home/nvidia/catkin_ws/src/aces_car/msg/intersection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/aces_car
)
_generate_msg_lisp(aces_car
  "/home/nvidia/catkin_ws/src/aces_car/msg/esc_signal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/aces_car
)

### Generating Services

### Generating Module File
_generate_module_lisp(aces_car
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/aces_car
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(aces_car_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(aces_car_generate_messages aces_car_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/catkin_ws/src/aces_car/msg/intersection.msg" NAME_WE)
add_dependencies(aces_car_generate_messages_lisp _aces_car_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/catkin_ws/src/aces_car/msg/esc_signal.msg" NAME_WE)
add_dependencies(aces_car_generate_messages_lisp _aces_car_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(aces_car_genlisp)
add_dependencies(aces_car_genlisp aces_car_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS aces_car_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(aces_car
  "/home/nvidia/catkin_ws/src/aces_car/msg/intersection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/aces_car
)
_generate_msg_nodejs(aces_car
  "/home/nvidia/catkin_ws/src/aces_car/msg/esc_signal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/aces_car
)

### Generating Services

### Generating Module File
_generate_module_nodejs(aces_car
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/aces_car
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(aces_car_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(aces_car_generate_messages aces_car_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/catkin_ws/src/aces_car/msg/intersection.msg" NAME_WE)
add_dependencies(aces_car_generate_messages_nodejs _aces_car_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/catkin_ws/src/aces_car/msg/esc_signal.msg" NAME_WE)
add_dependencies(aces_car_generate_messages_nodejs _aces_car_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(aces_car_gennodejs)
add_dependencies(aces_car_gennodejs aces_car_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS aces_car_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(aces_car
  "/home/nvidia/catkin_ws/src/aces_car/msg/intersection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aces_car
)
_generate_msg_py(aces_car
  "/home/nvidia/catkin_ws/src/aces_car/msg/esc_signal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aces_car
)

### Generating Services

### Generating Module File
_generate_module_py(aces_car
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aces_car
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(aces_car_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(aces_car_generate_messages aces_car_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/catkin_ws/src/aces_car/msg/intersection.msg" NAME_WE)
add_dependencies(aces_car_generate_messages_py _aces_car_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/catkin_ws/src/aces_car/msg/esc_signal.msg" NAME_WE)
add_dependencies(aces_car_generate_messages_py _aces_car_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(aces_car_genpy)
add_dependencies(aces_car_genpy aces_car_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS aces_car_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/aces_car)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/aces_car
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(aces_car_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/aces_car)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/aces_car
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(aces_car_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/aces_car)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/aces_car
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(aces_car_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/aces_car)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/aces_car
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(aces_car_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aces_car)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aces_car\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aces_car
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(aces_car_generate_messages_py std_msgs_generate_messages_py)
endif()
