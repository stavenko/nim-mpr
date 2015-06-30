import times
import context
import material
import scene
import mesh
import camera



type 
    Renderer* = ref  RendererObj not nil
    RendererObj = object 
        ctx : Context


proc initRenderer*():Renderer=
    var ctx = context.init();
    result = Renderer(ctx: ctx)

proc preparePass(r:Renderer, p: RenderPass)=
    echo "preparing pass"

proc renderObject(r:Renderer, obj:Mesh, pass:RenderPass)=
    echo "render theeee object"


proc renderPass(r:Renderer, scene:Scene, pass: RenderPass, camera:Camera)=
    var 
        material :Material
    r.preparePass(pass)
    for obj in scene.getObjects(pass):
        r.renderObject(obj, pass)


proc render(r:Renderer, scene:Scene, camera:Camera)=
    for pass in scene.collectPasses():
        r.renderPass(scene, pass, camera)


proc renderLoop*(r:Renderer, scene:Scene, camera:Camera, updater: proc(dt:float, gdt:float))=
    let timeStarted = epochTime()
    var 
        oldTime = timeStarted
        newTime:float = 0
        timeDelta:float =0
        globDiff:float =0
    while not r.ctx.shouldClose:
        newTime = epochTime();
        timeDelta = newTime - oldTime
        globDiff = newTime - timeStarted

        updater(timeDelta, globDiff )
        scene.update(timeDelta, globDiff )
        r.render(scene, camera)
        oldTime = newTime
proc renderLoop*(r:Renderer, scene:Scene, camera:Camera)=
    let updater = proc(t:float, gt:float)=
                    echo "default updater:", t, ", ", gt
    renderLoop(r, scene, camera, updater)

