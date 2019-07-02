/*
*  NODE MASTER
*  IP ADDRESS : 192.168.1.111
*  PORT       : 4210
*/

#include <ESP8266WiFi.h>
#include <WiFiUDP.h>

#define portNodeClient1   4211
#define portNodeClient2   4212
#define portNodeClient3   4213
#define portNodeClient4   4214
#define portNodeClient5   4215
#define portNodeClient6   4216

char ip_addreNodeClient1[] = ("192.168.1.139");
char ip_addreNodeClient2[] = ("192.168.1.123");
char ip_addreNodeClient3[]  = ("192.168.1.83");
char ip_addreNodeClient4[] = ("192.168.1.155");
char ip_addreNodeClient5[] = ("192.168.1.163");
char ip_addreNodeClient6[] = ("192.168.1.171");

const int nodeclient1 = 11;
const int nodeclient2 = 12;
const int nodeclient3 = 13;
const int nodeclient4 = 14;
const int nodeclient5 = 15;
const int nodeclient6 = 16;


int nilaibutton,sudah_print_on=true,sudah_print_off=true, lastdata=0, dataterima, datakirim;

WiFiUDP Udp;

IPAddress staticIP(192,168,1,111);
IPAddress gateway(192,168,1,1);
IPAddress subnet(255,255,255,0);
IPAddress dns(192,168,1,1);



unsigned int localUdpPort = 4210;
char incomingPacket[256];
char replyPacket[] = ("00");

void receivingData(int packetSize)
{
    int len = Udp.read(incomingPacket, 255);
    if (len > 0) incomingPacket[len] = 0;
    kirim();
}

void sendingData()
{
    switch(dataterima) {
      case 11: {
        replyPacket[0]='1';
        replyPacket[1]='1';
        Udp.beginPacket(ip_addreNodeClient1, portNodeClient1);
        Udp.write(replyPacket);
        Udp.endPacket();      
       break;
      }
      
      case 10: {
        replyPacket[0]='1';
        replyPacket[1]='0';
        Udp.beginPacket(ip_addreNodeClient1, portNodeClient1);
        Udp.write(replyPacket);
        Udp.endPacket();      
       break;
      }

      case 21: {
        replyPacket[0]='2';
        replyPacket[1]='1';
        Udp.beginPacket(ip_addreNodeClient2, portNodeClient2);
        Udp.write(replyPacket);
        Udp.endPacket();      
       break;
      }

      case 20: {
        replyPacket[0]='2';
        replyPacket[1]='0';
        Udp.beginPacket(ip_addreNodeClient2, portNodeClient2);
        Udp.write(replyPacket);
        Udp.endPacket();      
       break;
      }

      case 31: {
        replyPacket[0]='3';
        replyPacket[1]='1';
        Udp.beginPacket(ip_addreNodeClient3, portNodeClient3);
        Udp.write(replyPacket);
        Udp.endPacket();      
       break;
      }

      case 30: {
        replyPacket[0]='3';
        replyPacket[1]='0';
        Udp.beginPacket(ip_addreNodeClient3, portNodeClient3);
        Udp.write(replyPacket);
        Udp.endPacket();      
       break;
      }

      case 41: {
        replyPacket[0]='4';
        replyPacket[1]='1';
        Udp.beginPacket(ip_addreNodeClient4, portNodeClient4);
        Udp.write(replyPacket);
        Udp.endPacket();      
       break;
      }

      case 40: {
        replyPacket[0]='4';
        replyPacket[1]='0';
        Udp.beginPacket(ip_addreNodeClient4, portNodeClient4);
        Udp.write(replyPacket);
        Udp.endPacket();      
       break;
      }

      case 51: {
        replyPacket[0]='5';
        replyPacket[1]='1';
        Udp.beginPacket(ip_addreNodeClient5, portNodeClient5);
        Udp.write(replyPacket);
        Udp.endPacket();      
       break;
      }

      case 50: {
        replyPacket[0]='5';
        replyPacket[1]='0';
        Udp.beginPacket(ip_addreNodeClient5, portNodeClient5);
        Udp.write(replyPacket);
        Udp.endPacket();      
       break;
      }

      case 61: {
        replyPacket[0]='6';
        replyPacket[1]='1';
        Udp.beginPacket(ip_addreNodeClient6, portNodeClient6);
        Udp.write(replyPacket);
        Udp.endPacket();      
       break;
      }

      case 60: {
        replyPacket[0]='6';
        replyPacket[1]='0';
        Udp.beginPacket(ip_addreNodeClient6, portNodeClient6);
        Udp.write(replyPacket);
        Udp.endPacket();      
       break;
      }
    }
}


void setup() {
  Serial.begin(115200);
  WiFi.disconnect();
  WiFi.begin("nodemcu", "nodemcuwifi");
  while (WiFi.status() != WL_CONNECTED) delay(500);
  Udp.begin(localUdpPort);
}

void loop() {
  int packetSize = Udp.parsePacket();
  if(packetSize) receivingData(packetSize);
  else if(Serial.available()>0){
    dataterima = Serial.read();
    sendingData();
    delay(50);
  }

  //pengecekan IP pada nodemcu master
  //Serial.printf("Now master listening at IP %s, UDP port %d\n", WiFi.localIP().toString().c_str(), localUdpPort);
}

void kirim(){
  datakirim = atoi(incomingPacket);
  if(lastdata != datakirim){
    Serial.write(datakirim);
    lastdata = datakirim;
  }
}
