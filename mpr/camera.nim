type
    Camera* = ref object of RootObj
        viewMatrix: array[16,float]
        projectionMatrix:array[16,float]
    PerspectiveCamera* = ref object of Camera
        fov:  float
        near: float
        far:  float
        position: array[3,float]
        lookAt: array[3, float]
        up:array[3,float]
       

proc createPerspectiveCamera*(fov: float, near:float, far:float, position:array[3,float]):PerspectiveCamera=
    var 
        lookAt = [0.float, 0,0]
        up = [0.float, 1,0]
    return PerspectiveCamera( fov:fov, 
                              near:near, 
                              far:far, 
                              position:position, 
                              lookAt: lookAt, 
                              up: up)
method getViewMatrix*(c:Camera):array[16,float]=
    c.viewMatrix
method getProjectionMatrix*(c:Camera):array[16,float]=
    c.projectionMatrix

