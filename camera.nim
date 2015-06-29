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
       

method getViewMatrix(c:Camera):array[16,float]=
    c.viewMatrix
method getProjectionMatrix(c:Camera):array[16,float]=
    c.projectionMatrix

