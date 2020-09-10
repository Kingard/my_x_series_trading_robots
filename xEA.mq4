//+------------------------------------------------------------------+
//|                                                          xEA.mq4 |
//|                                                   Kingard Nwankwoh |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Kingard Nwankwoh"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   double movingAverage1 = iMA(NULL,0,15,0,MODE_SMA,PRICE_CLOSE,0);
   double movingAverage2 = iMA(NULL,0,50,0,MODE_SMA,PRICE_CLOSE,0);
   double rsi = iRSI(NULL,0,14,PRICE_CLOSE,0);
   
   if(Close[1] > iMA(Symbol(),0,200,1,MODE_SMA,PRICE_CLOSE,0)&& Close[2] < iMA(Symbol(),0,200,1,MODE_SMA,PRICE_CLOSE,0)&& movingAverage1 > movingAverage2)
   {
      //OrderSelect(0,SELECT_BY_POS);
      OrderClose(OrderTicket(),0.8,Bid,100,clrAquamarine);
      OrderSend(Symbol(),OP_BUY,0.8,Ask,100,NormalizeDouble(Ask-30*Point,Digits),NormalizeDouble(Ask+80*Point,Digits),NULL,0,0,clrAliceBlue);  
   }
   
    if(Close[1] < iMA(Symbol(),0,200,1,MODE_SMA,PRICE_CLOSE,0)&& Close[2] > iMA(Symbol(),0,200,1,MODE_SMA,PRICE_CLOSE,0) && movingAverage1 < movingAverage2)
   {
      //OrderSelect(0,SELECT_BY_POS);
      //OrderClose(OrderTicket(),0.8,Ask,100,clrAquamarine);
      OrderSend(Symbol(),OP_SELL,0.8,Bid,100,NormalizeDouble(Bid+30*Point,Digits),NormalizeDouble(Bid-80*Point,Digits),NULL,0,0,clrAliceBlue);  
   }
   
  }
//+------------------------------------------------------------------+
