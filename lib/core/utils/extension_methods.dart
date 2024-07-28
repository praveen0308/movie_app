extension ListNullSafety<E> on List<E>?{

  List<E> orEmpty() {
    if(this==null){
      return List.empty();
    }else{
      return this!;
    }
  }
}