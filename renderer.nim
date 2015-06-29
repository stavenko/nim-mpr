import context
import material
import scene
import mesh
import camera



type 
    Renderer = ref  RendererObj not nil
    RendererObj = object 
        ctx : Context


proc getRenderer():Renderer=
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
        r.renderPass(scene, pass, camera);


