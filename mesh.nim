import material

type 
    GeometryGeneric[I,F] = object
        indexes: seq[I]
        vertices:seq[F]
        uvs:array[3, seq[F]]
        normals: seq[F]
    MeshObjGeneric[I,F] = object
        geometry: GeometryGeneric[I,F]
        material: Material
    MeshObj = MeshObjGeneric[int, float]
    MeshObjG*[I,F] = ref MeshObjGeneric[I, F] not nil
    Mesh* = ref MeshObj not nil





