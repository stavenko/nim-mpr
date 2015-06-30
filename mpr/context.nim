static:
    var glfwStatic:string = gorge("pkg-config --static --libs glfw3 ")
    var linker:string = gorge("pkg-config --libs  glu x11 xrandr xxf86vm xcursor xinerama xi")
{.passL: glfwStatic.}

import glfw/glfw
import opengl

type 
    ContextObj = object 
        state: string
        shouldClose:bool
    Context* = ref ContextObj not nil

proc init*(): Context =
    result =  Context(state:"initialized", shouldClose:false);

proc shouldClose*(c:Context):bool=
    return c.shouldClose


if isMainModule:
    echo "compiled"
