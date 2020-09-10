//+------------------------------------------------------------------+
//|                                                       TestEA.mq4 |
//|                                                   Ebuka Nwankwoh |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Ebuka Nwankwoh"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#include <customFunctionsX.mqh>
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

int order;

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
   // LOGIC 1 
   double movingAverage1 = iMA(NULL,0,15,0,MODE_SMA,PRICE_CLOSE,0);
   double movingAverage2 = iMA(NULL,0,50,0,MODE_SMA,PRICE_CLOSE,0);
   double currentPrice = Close[0];
   double RSI = iRSI(NULL,0,14,PRICE_CLOSE,0);
   
   if(movingAverage1 > movingAverage2 && RSI < 20)
   {
      //Buy
      //OrderSelect(0,SELECT_BY_POS);
      OrderSend(NULL,OP_BUY,0.9,Ask,100,0,NormalizeDouble(Ask+100*Point,Digits));
      
      if( movingAverage1 == currentPrice)
      {
         OrderClose(OrderTicket(),0.9,currentPrice,0,clrAqua);
      }
      // getStopLossPrice(true,currentPrice,50)
      //getTakeProfitPrice(true,currentPrice,50
      //NormalizeDouble(Ask-50*Point,Digits)
      
   }
   else if(movingAverage2 > movingAverage1 && RSI > 80)
   {
      //Sell
      //OrderSelect(0,SELECT_BY_POS);
      
      OrderSend(NULL,OP_SELL,0.9,Bid,100,0,NormalizeDouble(Bid-100*Point,Digits));
      
      if(movingAverage1 == currentPrice)
      {
         OrderClose(OrderTicket(),0.9,currentPrice,0,clrAntiqueWhite);
      }
      //NormalizeDouble(Bid+30*Point,Digits)
      
   }
   
   // LOGIC 2
   
   
  }
//+------------------------------------------------------------------+
