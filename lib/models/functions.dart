class funcs{
  static String amounting(double x){
    if(x < 1000){
      return x.toStringAsFixed(1);
    }else if(10000 > x){
      return (x/1000).toStringAsFixed(2)+"k";
    }else{
      if(x <1000000){
        if(x>99999){
          return (x/1000).toStringAsFixed(0)+"k ";
        }else {
        return (x/1000).toStringAsFixed(1)+"k";
        }
      }else{
        return(x.toString()[0]+"."+x.toString()[1]+"M ");
      }
    }
  }
}