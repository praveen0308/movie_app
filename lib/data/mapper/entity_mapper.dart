abstract class EntityMapper<M,E>{
  E toEntity(M model);
  M fromEntity(E entity);
}