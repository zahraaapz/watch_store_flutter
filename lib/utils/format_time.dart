String formatTimer(int sec){
String result;
final duration=Duration(seconds: sec);


int h=duration.inHours;
int m=duration.inMinutes.remainder(60);
int s=duration.inSeconds.remainder(60);

if (sec>3600) {
  result ='$h:$m:$s';
} else {
   result ='$m:$s';
}
return result;
}