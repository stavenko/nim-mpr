import mesh
import material
type
    SceneObj = object
        materialManager: MaterialManager
        meshes:seq[Mesh] 
    Scene* = ref SceneObj not nil

proc bk()=
    echo "BK"

proc createScene*():Scene=
    var mm = createMaterialManager()
    var s:seq[Mesh]  = @[]
    return  Scene ( materialManager: mm, meshes:s)

proc collectPasses*(s: Scene):seq[RenderPass]=
    @[]
proc getObjects*(s: Scene,pass: RenderPass):seq[Mesh]=
    @[]


proc update*(s:Scene, timeDelta:float, totalTimeLeft:float)=
    echo "updating scene", timeDelta, " : ", totalTimeLeft
