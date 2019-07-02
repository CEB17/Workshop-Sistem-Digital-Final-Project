/*
  Pembuatan GUI menggunakan software Processing yang bisa didownload di website
  https://processing.org/.
  Pada program dibutuhkan library ControlP5 yang digunakan untuk membuat tombol per
  client dan komunikasi GUI ke arduino menggunakan komunikasi serial.
*/

import controlP5.*;
import processing.serial.*;

Serial port;
ControlP5 cp5;
controlP5.Button led1, led2, led3, led4, led5, led6, led7, led8, led9, led10;

PFont font;
color on = color(255,0,0);
color off = color(0,0,255);
boolean state1 = false, state2 = false, state3 = false, state4 = false, state5 = false, state6 = false, state7 = false, state8 = false, state9 = false, state10 = false;
color warna=off;
int data;
Table table;
String filename, led;

void setup(){
  size(1366, 768);
  printArray(Serial.list());
  String portName = Serial.list()[2];
  port = new Serial(this, portName, 115200);
  cp5 = new ControlP5(this);
  font = createFont("calibri light", 20);
  led1=cp5.addButton("LED1")
   .setPosition(100,50)
   .setSize(200,200)
   .setFont(font)
   .setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
  
  led2=cp5.addButton("LED2")
   .setPosition(339,50)
   .setSize(200,200)
   .setFont(font)
   .setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
  
  led3=cp5.addButton("LED3")
   .setPosition(578,50)
   .setSize(200,200)
   .setFont(font)
   .setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
  
  led4=cp5.addButton("LED4")
   .setPosition(817,50)
   .setSize(200,200)
   .setFont(font)
   .setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
  
  led5=cp5.addButton("LED5")
   .setPosition(1056,50)
   .setSize(200,200)
   .setFont(font)
   .setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
  
  led6=cp5.addButton("LED6")
   .setPosition(100,300)
   .setSize(200,200)
   .setFont(font)
   .setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
  
  led7=cp5.addButton("LED7")
   .setPosition(339,300)
   .setSize(200,200)
   .setFont(font)
   .setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
  
  led8=cp5.addButton("LED8")
   .setPosition(578,300)
   .setSize(200,200)
   .setFont(font)
   .setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
  
  led9=cp5.addButton("LED9")
   .setPosition(817,300)
   .setSize(200,200)
   .setFont(font)
   .setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
  
  led10=cp5.addButton("LED10")
   .setPosition(1056,300)
   .setSize(200,200)
   .setFont(font)
   .setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
  table=new Table();
  //String[] sep = {"sep=,"};
  //table.insertRow(0,sep);
  //table.addColumn("sep=,");
  //TableRow newRow1 = table.addRow();
  //newRow1.setString("sep=,","\n");
  //table.addRow();
  //table.addRow(table);
  table.addColumn("Date");
  table.addColumn("Time");
  table.addColumn("Data");
}

void draw(){
  background(255, 255, 255);
  fill(0, 0, 0);
  textFont(font);
  text("LED CONTROL", 683, 30);
  if(port.available()>0){
    data = port.read();
    println(data);
    text(data, 20, 500);
    pilih();
    tampung();
  }
  simpan();
}

void simpan()
{
  int d = day(), m = month(), h = hour(), min = minute(), s = second();
  if(h == 23 && min == 59 && s == 59)
  {
    filename = "data/" + str(m) + "-" + str(d) + "-" + str(h) + "-" + str(min) + "-" + str(s) + ".csv";
    saveTable(table, filename);
  }
}

void tampung()
{
  int  d = day(), m = month(), y = year(), h = hour(), min = minute(), s = second();
  if(data!=0){
      TableRow newRow = table.addRow();
      newRow.setString("Date", str(d) + "/" + str(m) + "/" + str(y-2000));
      newRow.setString("Time", str(h) + ":" + str(min) + ":" + str(s));
      newRow.setString("Data", led);
  }
}

void pilih(){
    switch (data){
      case 11  : state1=true; warna=on; led1.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 1 ON"; break;
      case 10 : state1=false; warna=off; led1.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 1 OFF"; break;
      case 21  : state2=true; warna=on; led2.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 2 ON"; break;
      case 20 : state2=false; warna=off; led2.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 2 OFF"; break;
      case 31  : state3=true; warna=on; led3.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 3 ON"; break;
      case 30 : state3=false; warna=off; led3.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 3 OFF"; break;
      case 41  : state4=true; warna=on; led4.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 4 ON"; break;
      case 40 : state4=true; warna=off; led4.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 4 OFF"; break;
      case 51  : state5=true; warna=on; led5.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 5 ON"; break;
      case 50 : state5=false; warna=off; led5.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 5 OFF"; break;
      case 61  : state6=true; warna=on; led6.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 6 ON"; break;
      case 60 : state6=false; warna=off; led6.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 6 OFF"; break;
      case 71  : state7=true; warna=on; led7.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 7 ON"; break;
      case 70 : state7=false; warna=off; led7.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 7 OFF"; break;
      case 81  : state8=true; warna=on; led8.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 8 ON"; break;
      case 80 : state8=false; warna=off; led8.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 8 OFF"; break;
      case 91  : state9=true; warna=on; led9.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 9 ON"; break;
      case 90 : state9=false; warna=off; led9.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 9 OFF"; break;
      case 101  : state10=true; warna=on; led10.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 10 ON"; break;
      case 100     : state10=false; warna=off; led10.setColorBackground(warna)
                                               .setColorForeground(warna)
                                               .setColorActive(warna)
                                               ; led="LED 10 OFF"; break;
      default  :
    } 
}  

void LED1(){
  if(!state1){
    state1=true;
    warna=on;
    port.write(11);
    led="LED 1 ON";
  }else{
    state1=false;
    warna=off;
    port.write(10);
    led="LED 1 OFF";
  }
  tampung();
  led1.setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
}

void LED2(){
  if(!state2){
    state2=true;
    warna=on;
    port.write(21);
    led="LED 2 ON";
  }else{
    state2=false;
    warna=off;
    port.write(20);
    led="LED 2 OFF";
  }
  tampung();
  led2.setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
}

void LED3(){
  if(!state3){
    state3=true;
    warna=on;
    port.write(31);
    led="LED 3 ON";
  }else{
    state3=false;
    warna=off;
    port.write(30);
    led="LED 3 OFF";
  }
  tampung();
  led3.setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
}

void LED4(){
  if(!state4){
    state4=true;
    warna=on;
    port.write(41);
    led="LED 4 ON";
  }else{
    state4=false;
    warna=off;
    port.write(40);
    led="LED 4 OFF";
  }
  tampung();
  led4.setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
}

void LED5(){
  if(!state5){
    state5=true;
    warna=on;
    port.write(51);
    led="LED 5 ON";
  }else{
    state5=false;
    warna=off;
    port.write(50);
    led="LED 5 OFF";
  }
  tampung();
  led5.setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
}

void LED6(){
  if(!state6){
    state6=true;
    warna=on;
    port.write(61);
    led="LED 6 ON";
  }else{
    state6=false;
    warna=off;
    port.write(60);
    led="LED 6 OFF";
  }
  tampung();
  led6.setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
}

void LED7(){
  if(!state7){
    state7=true;
    warna=on;
    port.write(71);
  }else{
    state7=false;
    warna=off;
    port.write(70);
  }
  tampung();
  led7.setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
}

void LED8(){
  if(!state8){
    state8=true;
    warna=on;
    port.write(81);
  }else{
    state8=false;
    warna=off;
    port.write(80);
  }
  tampung();
  led8.setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
}

void LED9(){
  if(!state9){
    state9=true;
    warna=on;
    port.write(91);
  }else{
    state9=false;
    warna=off;
    port.write(90);
  }
  tampung();
  led9.setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
}

void LED10(){
  if(!state10){
    state10=true;
    warna=on;
    port.write(101);
  }else{
    state10=false;
    warna=off;
    port.write(100);
  }
  tampung();
  led10.setColorBackground(warna)
   .setColorForeground(warna)
   .setColorActive(warna)
  ;
}

void keyPressed()
{
  int  d = day(), m = month(), h = hour(), min = minute(), s = second();
  filename = "data/" + str(m) + "-" + str(d) + "--" + str(h) + "-" + str(min) + "-" + str(s) + ".csv";
  saveTable(table, filename);
  exit();
}
