import tables, hashes
type
    PassMaterial = object
        vertexShader: string
        fragmentShader:string
    PassType = enum
        MAIN_PASS
        SUB_PASS
        FILTER_PASS
    RenderPass* = object
        material: PassMaterial
        isOverridesMaterial:bool
        sceneMaterial: PassMaterial
        passName :string
        passType: PassType
    MaterialObject = object
        passes: seq[RenderPass]
    Material* = ref MaterialObject not nil

    ShaderProgramId = distinct uint
    MaterialManagerObject = object
        materials: Table[PassMaterial, ShaderProgramId ]
    MaterialManager* = ref MaterialManagerObject
            
proc hash(pm:PassMaterial):Hash=
    result = pm.vertexShader.hash !& pm.fragmentShader.hash
    result = !$ result

proc createMaterialManager*():MaterialManager=
    result = MaterialManager(materials:initTable[PassMaterial, ShaderProgramId]())
