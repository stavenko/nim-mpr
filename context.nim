import glfw/glfw
import opengl

type 
    ContextObj = object 
        state: string
    Context* = ref ContextObj not nil

proc init*(): Context =
    result =  Context(state:"initialized");
