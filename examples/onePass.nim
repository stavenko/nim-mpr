import mpr.renderer
import mpr.scene
import mpr.camera
import times

type 
    BLAH = object
        name:string

method b(BLAH, t, dt)=
    echo ("BLAH", t," >>> ",  dt)
proc main()=
    let renderer = initRenderer()
    let scene = createScene()
    let camera = createPerspectiveCamera(45.0, 0.1, 1000.0, [0.float,0,0])  
    var bl = BLAH(name:"hi")
    var pew = proc(t:float, dt:float)= 
                bl.b(t, dt)
    renderer.renderLoop( scene, camera, pew )
    


main()
