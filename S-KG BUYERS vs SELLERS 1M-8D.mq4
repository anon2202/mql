//+------------------------------------------------------------------+
//|                       S-KG BUYERS VS SELLERS 1MINUTE / 8 Day.mq4 |
//|                               Copyright © 2009, KG. 2015 Saronko |
//|                Source Code: http://www.forexfactory.com/kang_gun |
//+------------------------------------------------------------------+
#property copyright    "Saronko and Kang Gun"
#property version      "1.00"
#property link         "http://www.forexfactory.com/showthread.php?t=213497"
#property link         "http://www.forexfactory.com/saronko"
#property description  "Source code Kang Gun 2009, modifications 2015 Saronko"
#property indicator_chart_window


extern string   Corner_Note        = "0 top left, 1 top right, 2 bottom left, 3 bottom right";
extern int      Corner             = 0;
extern int      Y_distanceGeneral  = -103;
extern int      X_distanceGeneral  = 1;
extern string   fontText           = "Arial";//Tw Cen MT Condensed Extra Bold
extern int      fontSizeText       = 7;
extern int      Text_Y_Shift       = 0;
extern color    colortext          = Gray;
extern string   fontSignal         = "Arial Black";//Lucida Console Calibri Arial Bauhaus 93 Arial Rounded MT Bold, Franklin Gothic Heavy FXM3
extern int      fontSizeSignal     = 8;
extern int      ArrowSize          = 10;
extern int      ArrowX_Shift       = 77;
extern int      BuyX_Shift         = 103;
extern int      SellX_Shift        = 32;
extern int      TfLabelX_Shift     = 2;

extern int      DecimalNumbers     = 2;
extern color    colorSignal        = Silver;
extern color    colorUP2           = Lime;
extern color    colorUP1           = Green;
extern color    colorFlat          = DimGray;
extern color    colorDown1         = FireBrick;
extern color    colorDown2         = Red;

extern color    BackBoxColor       = Black;
extern bool     Back_Transparent   = FALSE;
extern int      BackBoxXSize       = 145;
extern int      BackBoxYSize       = 322;
extern string   BackBox_Note       = "Corner 0 is OK, if corner is 1, 2 and 3 BackBox is lost in space. Help is below";
extern string   BackBox_Shift_Note = "IF Corner 0: X=0 Y=104; Cor. 1 X=145 Y=104; Cor. 2 X=0 Y=425; Cor. 3 X=145, Y=425";
extern int      BackBoxX_Shift     = 0;//0
extern int      BackBoxY_Shift     = 104;//104
extern string   IndiLabel          = "Saronko & KG © BvS";
extern string   BuyLabel           = "BUY%";
extern string   SellLabel          = "SELL%";
extern string   ArrowLabel         = "AwD";//Arrow Direction


//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
  {
   
      string bsd7bcde = "BSD_15Mbcde";
   ObjectDelete (bsd7bcde);
   ObjectCreate (bsd7bcde, OBJ_RECTANGLE_LABEL, 0, 0, 0 );
   ObjectSet    (bsd7bcde, OBJPROP_CORNER, Corner );
   ObjectSet    (bsd7bcde, OBJPROP_XDISTANCE, BackBoxX_Shift+X_distanceGeneral);
   ObjectSet    (bsd7bcde, OBJPROP_YDISTANCE, BackBoxY_Shift+Y_distanceGeneral );
   ObjectSet    (bsd7bcde, OBJPROP_SCALE, 1); 
//   ObjectSet    (bsd7bcde, OBJPROP_COLOR, BackBoxColor); 
   ObjectSet    (bsd7bcde, OBJPROP_BACK, Back_Transparent); //
   ObjectSet    (bsd7bcde, OBJPROP_BGCOLOR, BackBoxColor); // 
   ObjectSet    (bsd7bcde, OBJPROP_WIDTH, 0);  // Border 0 False 1 True
   ObjectSet    (bsd7bcde, OBJPROP_XSIZE, BackBoxXSize); 
   ObjectSet    (bsd7bcde, OBJPROP_YSIZE, BackBoxYSize); 
   
   
   string bsdz = "Time Frame";
   ObjectDelete(bsdz);
   ObjectCreate( bsdz, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsdz,"TF",fontSizeText, fontText, colorSignal);
   ObjectSet( bsdz, OBJPROP_CORNER, Corner );
   ObjectSet( bsdz, OBJPROP_XDISTANCE, 3+TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsdz, OBJPROP_YDISTANCE, 412+Y_distanceGeneral );   
/*   
   string bsdaz1 = "spacer";
   ObjectDelete(bsdaz1);
   ObjectCreate( bsdaz1, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsdaz1,"----------------------------------------",8, fontText, colortext);
   ObjectSet( bsdaz1, OBJPROP_CORNER, Corner );
   ObjectSet( bsdaz1, OBJPROP_XDISTANCE, 2+X_distanceGeneral );
   ObjectSet( bsdaz1, OBJPROP_YDISTANCE, 95+Y_distanceGeneral );   
*/   
   string bsdaz1z = "AwDdle";
   ObjectDelete(bsdaz1z);
   ObjectCreate( bsdaz1z, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsdaz1z,ArrowLabel,fontSizeText, fontText, colorSignal);
   ObjectSet( bsdaz1z, OBJPROP_CORNER, Corner );
   ObjectSet( bsdaz1z, OBJPROP_XDISTANCE, ArrowX_Shift-2+X_distanceGeneral );
   ObjectSet( bsdaz1z, OBJPROP_YDISTANCE, 412+Y_distanceGeneral );   
         
   string bsd = "BUY%";
   ObjectDelete(bsd);
   ObjectCreate( bsd, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd,BuyLabel,fontSizeText, fontText, colorUP2);
   ObjectSet( bsd, OBJPROP_CORNER, Corner );
   ObjectSet( bsd, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet( bsd, OBJPROP_YDISTANCE, 412+Y_distanceGeneral );   
   
   string bsda = "SELL%";
   ObjectDelete(bsda);
   ObjectCreate( bsda, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsda,SellLabel,fontSizeText, fontText, colorDown2);
   ObjectSet( bsda, OBJPROP_CORNER, Corner );
   ObjectSet( bsda, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet( bsda, OBJPROP_YDISTANCE, 412+Y_distanceGeneral );   
   
   string bsdy = "BSD_Y1";
   ObjectDelete(bsdy);
   ObjectCreate( bsdy, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsdy,"8 D",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsdy, OBJPROP_CORNER, Corner );
   ObjectSet( bsdy, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsdy, OBJPROP_YDISTANCE, 112+Text_Y_Shift+Y_distanceGeneral );   
   
   string bsdy4 = "BSD_MN4";
   ObjectDelete(bsdy4);
   ObjectCreate( bsdy4, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsdy4,"7 D",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsdy4, OBJPROP_CORNER, Corner );
   ObjectSet( bsdy4, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsdy4, OBJPROP_YDISTANCE, 127+Text_Y_Shift+Y_distanceGeneral );   
   
   string bsd0 = "BSD_MN1";
   ObjectDelete(bsd0);
   ObjectCreate( bsd0, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd0,"6 D",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsd0, OBJPROP_CORNER, Corner );
   ObjectSet( bsd0, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsd0, OBJPROP_YDISTANCE, 141+Text_Y_Shift+Y_distanceGeneral );   
   
   
   string bsd1 = "BSD_W1";
   ObjectDelete(bsd1);
   ObjectCreate( bsd1, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd1,"5 D",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsd1, OBJPROP_CORNER, Corner );
   ObjectSet( bsd1, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsd1, OBJPROP_YDISTANCE, 156+Text_Y_Shift+Y_distanceGeneral );   
   
   string bsd1a = "BSD_W1a";
   ObjectDelete(bsd1a);
   ObjectCreate( bsd1a, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd1a,"4 D",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsd1a, OBJPROP_CORNER, Corner );
   ObjectSet( bsd1a, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsd1a, OBJPROP_YDISTANCE, 171+Text_Y_Shift+Y_distanceGeneral );   
   
   string bsd1b = "BSD_W1b";
   ObjectDelete(bsd1b);
   ObjectCreate( bsd1b, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd1b,"3 D",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsd1b, OBJPROP_CORNER, Corner );
   ObjectSet( bsd1b, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsd1b, OBJPROP_YDISTANCE, 186+Text_Y_Shift+Y_distanceGeneral );   
   
   string bsd1c = "BSD_W1c";
   ObjectDelete(bsd1c);
   ObjectCreate( bsd1c, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd1c,"2 D",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsd1c, OBJPROP_CORNER, Corner );
   ObjectSet( bsd1c, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsd1c, OBJPROP_YDISTANCE, 201+Text_Y_Shift+Y_distanceGeneral );   
   
   
   string bsd2 = "BSD_D1";
   ObjectDelete(bsd2);
   ObjectCreate( bsd2, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd2,"1 D",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsd2, OBJPROP_CORNER, Corner );
   ObjectSet( bsd2, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsd2, OBJPROP_YDISTANCE, 216+Text_Y_Shift+Y_distanceGeneral );   
   
   string bsd2a = "BSD_D1a";
   ObjectDelete(bsd2a);
   ObjectCreate( bsd2a, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd2a,"18 H",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsd2a, OBJPROP_CORNER, Corner );
   ObjectSet( bsd2a, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsd2a, OBJPROP_YDISTANCE, 231+Text_Y_Shift+Y_distanceGeneral );   
   
   string bsd3 = "BSD_8H";
   ObjectDelete(bsd3);
   ObjectCreate( bsd3, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd3,"12 H",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsd3, OBJPROP_CORNER, Corner );
   ObjectSet( bsd3, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsd3, OBJPROP_YDISTANCE, 246+Text_Y_Shift+Y_distanceGeneral );   
   
   string bsd4 = "BSD_4H";
   ObjectDelete(bsd4);
   ObjectCreate( bsd4, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd4,"6 H",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsd4, OBJPROP_CORNER, Corner );
   ObjectSet( bsd4, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsd4, OBJPROP_YDISTANCE, 261+Text_Y_Shift+Y_distanceGeneral );   
   
   
   string bsd5a = "BSD_1Ha";
   ObjectDelete(bsd5a);
   ObjectCreate( bsd5a, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd5a,"4 H",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsd5a, OBJPROP_CORNER, Corner );
   ObjectSet( bsd5a, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsd5a, OBJPROP_YDISTANCE, 276+Text_Y_Shift+Y_distanceGeneral );  
   
   string bsd5b = "BSD_1Hb";
   ObjectDelete(bsd5b);
   ObjectCreate( bsd5b, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd5b,"2 H",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsd5b, OBJPROP_CORNER, Corner );
   ObjectSet( bsd5b, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsd5b, OBJPROP_YDISTANCE, 291+Text_Y_Shift+Y_distanceGeneral );  
     
   string bsd5 = "BSD_1H";
   ObjectDelete(bsd5);
   ObjectCreate( bsd5, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd5,"1 H",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsd5, OBJPROP_CORNER, Corner );
   ObjectSet( bsd5, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsd5, OBJPROP_YDISTANCE, 306+Text_Y_Shift+Y_distanceGeneral );  
   
   string bsd5c = "BSD_1Hc";
   ObjectDelete(bsd5c);
   ObjectCreate( bsd5c, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd5c,"45 M",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsd5c, OBJPROP_CORNER, Corner );
   ObjectSet( bsd5c, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsd5c, OBJPROP_YDISTANCE, 321+Text_Y_Shift+Y_distanceGeneral );  
    
     
   string bsd6 = "BSD_30M";
   ObjectDelete(bsd6);
   ObjectCreate( bsd6, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd6,"30 M",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsd6, OBJPROP_CORNER, Corner );
   ObjectSet( bsd6, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsd6, OBJPROP_YDISTANCE, 336+Text_Y_Shift+Y_distanceGeneral );   
   
   string bsd7 = "BSD_15M";
   ObjectDelete(bsd7);
   ObjectCreate( bsd7, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd7,"15 M",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsd7, OBJPROP_CORNER, Corner );
   ObjectSet( bsd7, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsd7, OBJPROP_YDISTANCE, 351+Text_Y_Shift+Y_distanceGeneral );  
   
   string bsd7a = "BSD_15Ma";
   ObjectDelete(bsd7a);
   ObjectCreate( bsd7a, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd7a,"10 M",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsd7a, OBJPROP_CORNER, Corner );
   ObjectSet( bsd7a, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsd7a, OBJPROP_YDISTANCE, 366+Text_Y_Shift+Y_distanceGeneral );   
   
   string bsd7b = "BSD_15Mb";
   ObjectDelete(bsd7b);
   ObjectCreate( bsd7b, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd7b,"5 M",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsd7b, OBJPROP_CORNER, Corner );
   ObjectSet( bsd7b, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsd7b, OBJPROP_YDISTANCE, 381+Text_Y_Shift+Y_distanceGeneral ); 
   
   string bsd5aa = "BSD_5Mb";
   ObjectDelete(bsd5aa);
   ObjectCreate( bsd5aa, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd5aa,"1 M",1+fontSizeText, fontText, colorSignal);
   ObjectSet( bsd5aa, OBJPROP_CORNER, Corner );
   ObjectSet( bsd5aa, OBJPROP_XDISTANCE,TfLabelX_Shift+X_distanceGeneral );
   ObjectSet( bsd5aa, OBJPROP_YDISTANCE, 396+Text_Y_Shift+Y_distanceGeneral );  
   
   string bsd7bc = "BSD_15Mbc";
   ObjectDelete(bsd7bc);
   ObjectCreate( bsd7bc, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(bsd7bc,IndiLabel,fontSizeText, fontText, colortext);
   ObjectSet( bsd7bc, OBJPROP_CORNER, Corner );
   ObjectSet( bsd7bc, OBJPROP_XDISTANCE, 18+X_distanceGeneral );
   ObjectSet( bsd7bc, OBJPROP_YDISTANCE, 425+Y_distanceGeneral ); 
    

             
   return(0);
   
  }
//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   ObjectDelete("Time Frame");
   ObjectDelete("spacer");
   ObjectDelete("AwDdle");
   ObjectDelete("BUY%");
   ObjectDelete("SELL%");
   ObjectDelete("BSD_Y1");
   ObjectDelete("BSD_MN4");
   ObjectDelete("BSD_MN1");
   ObjectDelete("BSD_W1");
   ObjectDelete("BSD_W1a");
   ObjectDelete("BSD_W1b");
   ObjectDelete("BSD_W1c");
   ObjectDelete("BSD_D1");
   ObjectDelete("BSD_D1a");
   ObjectDelete("BSD_8H");
   ObjectDelete("BSD_4H");
   ObjectDelete("BSD_1H");
   ObjectDelete("BSD_1Ha");
   ObjectDelete("BSD_1Hb");
   ObjectDelete("BSD_1Hc");
   ObjectDelete("BSD_30M");
   ObjectDelete("BSD_15M");
   ObjectDelete("BSD_15Ma");
   ObjectDelete("BSD_15Mb");
   ObjectDelete("BSD_15Mbc");
   ObjectDelete("BSD_15Mbcd");
   ObjectDelete("BSD_15Mbcde");
   
   ObjectDelete("BY1");
   ObjectDelete("SY1");
   ObjectDelete("BMN4");
   ObjectDelete("SMN4");
   ObjectDelete("BMN1");
   ObjectDelete("SMN1");
   ObjectDelete("BW1");
   ObjectDelete("BW1a");
   ObjectDelete("BW1b");
   ObjectDelete("BW1c");
   ObjectDelete("SW1");
   ObjectDelete("SW1a");
   ObjectDelete("SW1b");
   ObjectDelete("SW1c");
   ObjectDelete("BD1");
   ObjectDelete("BD1a");
   ObjectDelete("SD1");
   ObjectDelete("SD1a");
   ObjectDelete("B8H");
   ObjectDelete("S8H");
   ObjectDelete("B4H");
   ObjectDelete("S4H");
   ObjectDelete("B1H");
   ObjectDelete("B1Ha");
   ObjectDelete("B1Hb");
   ObjectDelete("B1Hc");
   ObjectDelete("S1H");
   ObjectDelete("S1Ha");
   ObjectDelete("S1Hb");
   ObjectDelete("S1Hc");
   ObjectDelete("BM30");
   ObjectDelete("SM30");
   ObjectDelete("BM15");
   ObjectDelete("BM15a");
   ObjectDelete("BM15ab");
   ObjectDelete("SM15");
   ObjectDelete("SM15a");
   ObjectDelete("SM15ab");
   
   ObjectDelete("Yearly BB");
   ObjectDelete("4Month BB");
   ObjectDelete("Monthly BB");
   ObjectDelete("Weekly BB");
   ObjectDelete("Weekly BBa");
   ObjectDelete("Weekly BBb");
   ObjectDelete("Weekly BBc");
   ObjectDelete("Daily BB");
   ObjectDelete("Daily BBa");
   ObjectDelete("12H BB");
   ObjectDelete("6H BB");
   ObjectDelete("3H BB");
   ObjectDelete("3H BBa");
   ObjectDelete("3H BBb");
   ObjectDelete("3H BBc");
   ObjectDelete("90 mnt BB");
   ObjectDelete("45 mnt BB");
   ObjectDelete("45 mnt BBa");
   ObjectDelete("45 mnt BBab");
   ObjectDelete("BM1");
   ObjectDelete("SM1");
   ObjectDelete("BSD_5Mb");
   ObjectDelete("BSD_5Mb");
   ObjectDelete("ZM1");
   ObjectDelete("BSD_5Mb");
   
   return(0);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int start()
  {
   int    counted_bars=IndicatorCounted();
//----
   int limit=Bars-counted_bars;
   if(counted_bars>0) limit++;
   
   string Sign;   
   color Col, Arr;
   
   
  // 8D (20)
   double highest_y1 = iHigh(NULL, PERIOD_M30, iHighest(NULL, PERIOD_M30, MODE_HIGH, 384, 0));
   double lowest_y1  = iLow(NULL, PERIOD_M30, iLowest(NULL, PERIOD_M30, MODE_LOW, 384, 0));
   double y1_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_y1 )/(highest_y1-lowest_y1);
   
   if (y1_buyers>=75) { Col=colorUP2; }
   if (y1_buyers>50 && y1_buyers<75) { Col=colorUP1; }
   if (y1_buyers<50 && y1_buyers>25) { Col=colorDown1; }
   if (y1_buyers<25 ) { Col=colorDown2; }
   if (y1_buyers==50) { Col=colorFlat; }
   
   string b_disp_y1 = "BY1";
   ObjectDelete(b_disp_y1);
   ObjectCreate(b_disp_y1, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_y1, DoubleToStr(y1_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_y1, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_y1, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_y1, OBJPROP_YDISTANCE, 110+Y_distanceGeneral );
   
   
   highest_y1 = iHigh(NULL, PERIOD_M30, iHighest(NULL, PERIOD_M30, MODE_HIGH, 384, 0));
   lowest_y1  = iLow(NULL, PERIOD_M30, iLowest(NULL, PERIOD_M30, MODE_LOW, 384, 0)); 
   double y1_sellers=100*(highest_y1-iClose(NULL,PERIOD_M1,0) )/(highest_y1-lowest_y1);   
   
   if (y1_sellers>=75) { Col=colorDown2; }
   if (y1_sellers>50 && y1_sellers<75) { Col=colorDown1; }
   if (y1_sellers<50 && y1_sellers>25) { Col=colorUP1; }
   if (y1_sellers<25) { Col=colorUP2; }
   if (y1_sellers==50) { Col=colorFlat; }
   
   string s_disp_y1 = "SY1";
   ObjectDelete(s_disp_y1);
   ObjectCreate(s_disp_y1, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_y1, DoubleToStr(y1_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_y1, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_y1, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_y1, OBJPROP_YDISTANCE, 110+Y_distanceGeneral );
      
//*************Arrow code   
   if (y1_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (y1_sellers>50 && y1_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (y1_sellers<50 && y1_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (y1_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (y1_sellers==50) { Sign="n"; Arr=colorFlat; } 
   if (y1_buyers==y1_sellers) { Sign="n"; Arr=colorFlat; }

      
   string sign1 = "Yearly BB";
   ObjectDelete(sign1);
   ObjectCreate(sign1, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign1, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign1, OBJPROP_CORNER, Corner );
   ObjectSet(sign1, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign1, OBJPROP_YDISTANCE, 110+Y_distanceGeneral );
   
  // 7D (19)
   double highest_mn4 = iHigh(NULL, PERIOD_M15, iHighest(NULL, PERIOD_M15, MODE_HIGH, 672, 0));
   double lowest_mn4  = iLow(NULL, PERIOD_M15, iLowest(NULL, PERIOD_M15, MODE_LOW, 672, 0));
   double mn4_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_mn4 )/(highest_mn4-lowest_mn4);
   
   if (mn4_buyers>=75) { Col=colorUP2; } 
   if (mn4_buyers>50 && mn4_buyers<75) { Col=colorUP1; }
   if (mn4_buyers<50 && mn4_buyers>25) { Col=colorDown1; } 
   if (mn4_buyers<25 ) { Col=colorDown2; }
   if (mn4_buyers==50) { Col=colorFlat; }
    
   string b_disp_mn4 = "BMN4";
   ObjectDelete(b_disp_mn4);
   ObjectCreate(b_disp_mn4, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_mn4, DoubleToStr(mn4_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_mn4, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_mn4, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_mn4, OBJPROP_YDISTANCE, 125+Y_distanceGeneral );
   
   
   highest_mn4 = iHigh(NULL, PERIOD_M15, iHighest(NULL, PERIOD_M15, MODE_HIGH, 672, 0));
   lowest_mn4  = iLow(NULL, PERIOD_M15, iLowest(NULL, PERIOD_M15, MODE_LOW, 672, 0)); 
   double mn4_sellers=100*(highest_mn4-iClose(NULL,PERIOD_M1,0) )/(highest_mn4-lowest_mn4);   
   
   if (mn4_sellers>=75) { Col=colorDown2; }
   if (mn4_sellers>50 && mn4_sellers<75) { Col=colorDown1; }
   if (mn4_sellers<50 && mn4_sellers>25) { Col=colorUP1; } 
   if (mn4_sellers<25) { Col=colorUP2; } 
   if (mn4_sellers==50) { Col=colorFlat; } 
   
   string s_disp_mn4 = "SMN4";
   ObjectDelete(s_disp_mn4);
   ObjectCreate(s_disp_mn4, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_mn4, DoubleToStr(mn4_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_mn4, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_mn4, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_mn4, OBJPROP_YDISTANCE, 125+Y_distanceGeneral );
   
//*************Arrow code   
   if (mn4_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (mn4_sellers>50 && mn4_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (mn4_sellers<50 && mn4_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (mn4_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (mn4_sellers==50) { Sign="n"; Arr=colorFlat; } 
   if (mn4_buyers==mn4_sellers) { Sign="n"; Arr=colorFlat; }

   string sign2 = "4Month BB";
   ObjectDelete(sign2);
   ObjectCreate(sign2, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign2, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign2, OBJPROP_CORNER, Corner );
   ObjectSet(sign2, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign2, OBJPROP_YDISTANCE, 125+Y_distanceGeneral );
   
  // 6D (18)
   double highest_mn1 = iHigh(NULL, PERIOD_M15, iHighest(NULL, PERIOD_M15, MODE_HIGH, 576, 0));
   double lowest_mn1  = iLow(NULL, PERIOD_M15, iLowest(NULL, PERIOD_M15, MODE_LOW, 576, 0)); 
   double mn1_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_mn1 )/(highest_mn1-lowest_mn1);
   
   if (mn1_buyers>=75) { Col=colorUP2; } 
   if (mn1_buyers>50 && mn1_buyers<75) { Col=colorUP1; }
   if (mn1_buyers<50 && mn1_buyers>25) { Col=colorDown1; }
   if (mn1_buyers<25 ) { Col=colorDown2; } 
   if (mn1_buyers==50) { Col=colorFlat; }
   
   string b_disp_mn1 = "BMN1";
   ObjectDelete(b_disp_mn1);
   ObjectCreate(b_disp_mn1, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_mn1, DoubleToStr(mn1_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_mn1, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_mn1, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_mn1, OBJPROP_YDISTANCE, 140+Y_distanceGeneral );
   
   highest_mn1 = iHigh(NULL, PERIOD_M15, iHighest(NULL, PERIOD_M15, MODE_HIGH, 576, 0));
   lowest_mn1  = iLow(NULL, PERIOD_M15, iLowest(NULL, PERIOD_M15, MODE_LOW, 576, 0));
   double mn1_sellers=100*(highest_mn1-iClose(NULL,PERIOD_M1,0) )/(highest_mn1-lowest_mn1);   
   
   if (mn1_sellers>=75) { Col=colorDown2; } 
   if (mn1_sellers>50 && mn1_sellers<75) { Col=colorDown1; }
   if (mn1_sellers<50 && mn1_sellers>25) { Col=colorUP1; } 
   if (mn1_sellers<25) { Col=colorUP2; } 
   if (mn1_sellers==50) { Col=colorFlat; }
   
   string s_disp_mn1 = "SMN1";
   ObjectDelete(s_disp_mn1);
   ObjectCreate(s_disp_mn1, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_mn1, DoubleToStr(mn1_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_mn1, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_mn1, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_mn1, OBJPROP_YDISTANCE, 140+Y_distanceGeneral );
   
//*************Arrow code   
   if (mn1_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (mn1_sellers>50 && mn1_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (mn1_sellers<50 && mn1_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (mn1_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (mn1_sellers==50) { Sign="n"; Arr=colorFlat; } 
   if (mn1_buyers==mn1_sellers) { Sign="n"; Arr=colorFlat; }

       
   string sign3 = "Monthly BB";
   ObjectDelete(sign3);
   ObjectCreate(sign3, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign3, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign3, OBJPROP_CORNER, Corner );
   ObjectSet(sign3, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign3, OBJPROP_YDISTANCE, 140+Y_distanceGeneral );
   
  // 5D (17)
   double highest_w1 = iHigh(NULL, PERIOD_M15, iHighest(NULL, PERIOD_M15, MODE_HIGH, 480, 0));
   double lowest_w1  = iLow(NULL, PERIOD_M15, iLowest(NULL, PERIOD_M15, MODE_LOW, 480, 0)); 
   double w1_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_w1 )/(highest_w1-lowest_w1);
   
   if (w1_buyers>=75) { Col=colorUP2; } 
   if (w1_buyers>50 && w1_buyers<75) { Col=colorUP1; }
   if (w1_buyers<50 && w1_buyers>25) { Col=colorDown1; }
   if (w1_buyers<25 ) { Col=colorDown2; } 
   if (w1_buyers==50) { Col=colorFlat; } 
   
   string b_disp_w1 = "BW1";
   ObjectDelete(b_disp_w1);
   ObjectCreate(b_disp_w1, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_w1, DoubleToStr(w1_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_w1, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_w1, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_w1, OBJPROP_YDISTANCE, 155+Y_distanceGeneral );
   
   highest_w1 = iHigh(NULL, PERIOD_M15, iHighest(NULL, PERIOD_M15, MODE_HIGH, 480, 0));
   lowest_w1  = iLow(NULL, PERIOD_M15, iLowest(NULL, PERIOD_M15, MODE_LOW, 480, 0));
   double w1_sellers=100*(highest_w1-iClose(NULL,PERIOD_M1,0) )/(highest_w1-lowest_w1);
   
   if (w1_sellers>=75) { Col=colorDown2; } 
   if (w1_sellers>50 && w1_sellers<75) { Col=colorDown1; }
   if (w1_sellers<50 && w1_sellers>25) { Col=colorUP1; } 
   if (w1_sellers<25) { Col=colorUP2; }
   if (w1_sellers==50) { Col=colorFlat; }
   
   string s_disp_w1 = "SW1";
   ObjectDelete(s_disp_w1);
   ObjectCreate(s_disp_w1, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_w1, DoubleToStr(w1_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_w1, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_w1, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_w1, OBJPROP_YDISTANCE, 155+Y_distanceGeneral );
   
//*************Arrow code   
   if (w1_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (w1_sellers>50 && w1_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (w1_sellers<50 && w1_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (w1_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (w1_sellers==50) { Sign="n"; Arr=colorFlat; } 
   if (w1_buyers==w1_sellers) { Sign="n"; Arr=colorFlat; }
   
   string sign4 = "Weekly BB";
   ObjectDelete(sign4);
   ObjectCreate(sign4, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign4, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign4, OBJPROP_CORNER, Corner );
   ObjectSet(sign4, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign4, OBJPROP_YDISTANCE, 155+Y_distanceGeneral );
   
  // 4D (16)
   double highest_w1a = iHigh(NULL, PERIOD_M15, iHighest(NULL, PERIOD_M15, MODE_HIGH, 384, 0));
   double lowest_w1a  = iLow(NULL, PERIOD_M15, iLowest(NULL, PERIOD_M15, MODE_LOW, 384, 0));
   double w1a_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_w1a )/(highest_w1a-lowest_w1a);
   
   if (w1a_buyers>=75) { Col=colorUP2; }
   if (w1a_buyers>50 && w1a_buyers<75) { Col=colorUP1; }
   if (w1a_buyers<50 && w1a_buyers>25) { Col=colorDown1; } 
   if (w1a_buyers<25 ) { Col=colorDown2; }
   if (w1a_buyers==50) { Col=colorFlat; }
   
   string b_disp_w1a = "BW1a";
   ObjectDelete(b_disp_w1a);
   ObjectCreate(b_disp_w1a, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_w1a, DoubleToStr(w1a_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_w1a, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_w1a, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_w1a, OBJPROP_YDISTANCE, 170+Y_distanceGeneral );
   
   highest_w1a = iHigh(NULL, PERIOD_M15, iHighest(NULL, PERIOD_M15, MODE_HIGH, 384, 0));
   lowest_w1a  = iLow(NULL, PERIOD_M15, iLowest(NULL, PERIOD_M15, MODE_LOW, 384, 0));
   double w1a_sellers=100*(highest_w1a-iClose(NULL,PERIOD_M1,0) )/(highest_w1a-lowest_w1a);
   
   if (w1a_sellers>=75) { Col=colorDown2; } 
   if (w1a_sellers>50 && w1a_sellers<75) { Col=colorDown1; }
   if (w1a_sellers<50 && w1a_sellers>25) { Col=colorUP1; }
   if (w1a_sellers<25) { Col=colorUP2; }
   if (w1a_sellers==50) { Col=colorFlat; }
   
   string s_disp_w1a = "SW1a";
   ObjectDelete(s_disp_w1a);
   ObjectCreate(s_disp_w1a, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_w1a, DoubleToStr(w1a_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_w1a, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_w1a, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_w1a, OBJPROP_YDISTANCE, 170+Y_distanceGeneral );
   
//*************Arrow code   
   if (w1a_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (w1a_sellers>50 && w1a_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (w1a_sellers<50 && w1a_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (w1a_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (w1a_sellers==50) { Sign="n"; Arr=colorFlat; } 
   if (w1a_buyers==w1a_sellers) { Sign="n"; Arr=colorFlat; }

      
   string sign4a = "Weekly BBa";
   ObjectDelete(sign4a);
   ObjectCreate(sign4a, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign4a, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign4a, OBJPROP_CORNER, Corner );
   ObjectSet(sign4a, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign4a, OBJPROP_YDISTANCE, 170+Y_distanceGeneral );
   
  // 3D (15)
   double highest_w1b = iHigh(NULL, PERIOD_M15, iHighest(NULL, PERIOD_M15, MODE_HIGH, 288, 0));
   double lowest_w1b  = iLow(NULL, PERIOD_M15, iLowest(NULL, PERIOD_M15, MODE_LOW, 288, 0));
   double w1b_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_w1b )/(highest_w1b-lowest_w1b);
   
   if (w1b_buyers>=75) { Col=colorUP2; }
   if (w1b_buyers>50 && w1b_buyers<75) { Col=colorUP1; }
   if (w1b_buyers<50 && w1b_buyers>25) { Col=colorDown1; }
   if (w1b_buyers<25 ) { Col=colorDown2; } 
   if (w1b_buyers==50) { Col=colorFlat; }
   
   string b_disp_w1b = "BW1b";
   ObjectDelete(b_disp_w1b);
   ObjectCreate(b_disp_w1b, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_w1b, DoubleToStr(w1b_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_w1b, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_w1b, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_w1b, OBJPROP_YDISTANCE, 185+Y_distanceGeneral );
   
   highest_w1b = iHigh(NULL, PERIOD_M15, iHighest(NULL, PERIOD_M15, MODE_HIGH, 288, 0));
   lowest_w1b  = iLow(NULL, PERIOD_M15, iLowest(NULL, PERIOD_M15, MODE_LOW, 288, 0));
   double w1b_sellers=100*(highest_w1b-iClose(NULL,PERIOD_M1,0) )/(highest_w1b-lowest_w1b);
   
   if (w1b_sellers>=75) { Col=colorDown2; } 
   if (w1b_sellers>50 && w1b_sellers<75) { Col=colorDown1; }
   if (w1b_sellers<50 && w1b_sellers>25) { Col=colorUP1; } 
   if (w1b_sellers<25) { Col=colorUP2; }
   if (w1b_sellers==50) { Col=colorFlat; }
   
   string s_disp_w1b = "SW1b";
   ObjectDelete(s_disp_w1b);
   ObjectCreate(s_disp_w1b, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_w1b, DoubleToStr(w1b_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_w1b, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_w1b, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_w1b, OBJPROP_YDISTANCE, 185+Y_distanceGeneral );
   
//*************Arrow code   
   if (w1b_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (w1b_sellers>50 && w1b_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (w1b_sellers<50 && w1b_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (w1b_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (w1b_sellers==50) { Sign="n"; Arr=colorFlat; } 
   if (w1b_buyers==w1b_sellers) { Sign="n"; Arr=colorFlat; }

      
   string sign4b = "Weekly BBb";
   ObjectDelete(sign4b);
   ObjectCreate(sign4b, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign4b, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign4b, OBJPROP_CORNER, Corner );
   ObjectSet(sign4b, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign4b, OBJPROP_YDISTANCE, 185+Y_distanceGeneral );
   
  // 2D (14)
   double highest_w1c = iHigh(NULL, PERIOD_M15, iHighest(NULL, PERIOD_M15, MODE_HIGH, 192, 0));
   double lowest_w1c  = iLow(NULL, PERIOD_M15, iLowest(NULL, PERIOD_M15, MODE_LOW, 192, 0));
   double w1c_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_w1c )/(highest_w1c-lowest_w1c);
   
   if (w1c_buyers>=75) { Col=colorUP2; }
   if (w1c_buyers>50 && w1c_buyers<75) { Col=colorUP1; }
   if (w1c_buyers<50 && w1c_buyers>25) { Col=colorDown1; }
   if (w1c_buyers<25 ) { Col=colorDown2; }
   if (w1c_buyers==50) { Col=colorFlat; }
   
   string b_disp_w1c = "BW1c";
   ObjectDelete(b_disp_w1c);
   ObjectCreate(b_disp_w1c, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_w1c, DoubleToStr(w1c_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_w1c, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_w1c, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_w1c, OBJPROP_YDISTANCE, 200+Y_distanceGeneral );
   
   highest_w1c = iHigh(NULL, PERIOD_M15, iHighest(NULL, PERIOD_M15, MODE_HIGH, 192, 0));
   lowest_w1c  = iLow(NULL, PERIOD_M15, iLowest(NULL, PERIOD_M15, MODE_LOW, 192, 0)); 
   double w1c_sellers=100*(highest_w1c-iClose(NULL,PERIOD_M1,0) )/(highest_w1c-lowest_w1c);
   
   if (w1c_sellers>=75) { Col=colorDown2; } 
   if (w1c_sellers>50 && w1c_sellers<75) { Col=colorDown1; }
   if (w1c_sellers<50 && w1c_sellers>25) { Col=colorUP1; }
   if (w1c_sellers<25) { Col=colorUP2; }
   if (w1c_sellers==50) { Col=colorFlat; }
   
   string s_disp_w1c = "SW1c";
   ObjectDelete(s_disp_w1c);
   ObjectCreate(s_disp_w1c, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_w1c, DoubleToStr(w1c_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_w1c, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_w1c, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_w1c, OBJPROP_YDISTANCE, 200+Y_distanceGeneral );
   
//*************Arrow code   
   if (w1c_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (w1c_sellers>50 && w1c_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (w1c_sellers<50 && w1c_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (w1c_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (w1c_sellers==50) { Sign="n"; Arr=colorFlat; } 
   if (w1c_buyers==w1c_sellers) { Sign="n"; Arr=colorFlat; }

      
   string sign4c = "Weekly BBc";
   ObjectDelete(sign4c);
   ObjectCreate(sign4c, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign4c, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign4c, OBJPROP_CORNER, Corner );
   ObjectSet(sign4c, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign4c, OBJPROP_YDISTANCE, 200+Y_distanceGeneral );
   
   // 1D (13)
   double highest_d1 = iHigh(NULL, PERIOD_M15, iHighest(NULL, PERIOD_M15, MODE_HIGH, 96, 0));
   double lowest_d1  = iLow(NULL, PERIOD_M15, iLowest(NULL, PERIOD_M15, MODE_LOW, 96, 0));
   double d1_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_d1 )/(highest_d1-lowest_d1);
   
   if (d1_buyers>=75) { Col=colorUP2; }
   if (d1_buyers>50 && d1_buyers<75) { Col=colorUP1; }
   if (d1_buyers<50 && d1_buyers>25) { Col=colorDown1; }
   if (d1_buyers<25 ) { Col=colorDown2; }
   if (d1_buyers==50) { Col=colorFlat; }
   
   string b_disp_d1 = "BD1";
   ObjectDelete(b_disp_d1);
   ObjectCreate(b_disp_d1, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_d1, DoubleToStr(d1_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_d1, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_d1, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_d1, OBJPROP_YDISTANCE, 215+Y_distanceGeneral );
   
   highest_d1 = iHigh(NULL, PERIOD_M15, iHighest(NULL, PERIOD_M15, MODE_HIGH, 96, 0));
   lowest_d1  = iLow(NULL, PERIOD_M15, iLowest(NULL, PERIOD_M15, MODE_LOW, 96, 0));
   double d1_sellers=100*(highest_d1-iClose(NULL,PERIOD_M1,0) )/(highest_d1-lowest_d1);
   
   if (d1_sellers>=75) { Col=colorDown2; }
   if (d1_sellers>50 && d1_sellers<75) { Col=colorDown1; }
   if (d1_sellers<50 && d1_sellers>25) { Col=colorUP1; }
   if (d1_sellers<25) { Col=colorUP2; } 
   if (d1_sellers==50) { Col=colorFlat; } 
   
   string s_disp_d1 = "SD1";
   ObjectDelete(s_disp_d1);
   ObjectCreate(s_disp_d1, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_d1, DoubleToStr(d1_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_d1, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_d1, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_d1, OBJPROP_YDISTANCE, 215+Y_distanceGeneral );
   
//*************Arrow code   
   if (d1_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (d1_sellers>50 && d1_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (d1_sellers<50 && d1_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (d1_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (d1_sellers==50) { Sign="n"; Arr=colorFlat; } 
   if (d1_buyers==d1_sellers) { Sign="n"; Arr=colorFlat; }
  
      
   string sign5 = "Daily BB";
   ObjectDelete(sign5);
   ObjectCreate(sign5, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign5, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign5, OBJPROP_CORNER, Corner );
   ObjectSet(sign5, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign5, OBJPROP_YDISTANCE, 215+Y_distanceGeneral );
   
   // 18 HOURS (12)
   double highest_d1a = iHigh(NULL, PERIOD_M15, iHighest(NULL, PERIOD_M15, MODE_HIGH, 72, 0));
   double lowest_d1a  = iLow(NULL, PERIOD_M15, iLowest(NULL, PERIOD_M15, MODE_LOW, 72, 0)); 
   double d1a_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_d1a )/(highest_d1a-lowest_d1a);
   
   if (d1a_buyers>=75) { Col=colorUP2; } 
   if (d1a_buyers>50 && d1a_buyers<75) { Col=colorUP1; }
   if (d1a_buyers<50 && d1a_buyers>25) { Col=colorDown1; }
   if (d1a_buyers<25 ) { Col=colorDown2; }
   if (d1a_buyers==50) { Col=colorFlat; }
   
   string b_disp_d1a = "BD1a";
   ObjectDelete(b_disp_d1a);
   ObjectCreate(b_disp_d1a, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_d1a, DoubleToStr(d1a_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_d1a, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_d1a, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_d1a, OBJPROP_YDISTANCE, 230+Y_distanceGeneral );
   
   highest_d1a = iHigh(NULL, PERIOD_M15, iHighest(NULL, PERIOD_M15, MODE_HIGH, 72, 0));
   lowest_d1a  = iLow(NULL, PERIOD_M15, iLowest(NULL, PERIOD_M15, MODE_LOW, 72, 0)); 
   double d1a_sellers=100*(highest_d1a-iClose(NULL,PERIOD_M1,0) )/(highest_d1a-lowest_d1a);
   
   if (d1a_sellers>=75) { Col=colorDown2; }
   if (d1a_sellers>50 && d1a_sellers<75) { Col=colorDown1; }
   if (d1a_sellers<50 && d1a_sellers>25) { Col=colorUP1; } 
   if (d1a_sellers<25) { Col=colorUP2; }
   if (d1a_sellers==50) { Col=colorFlat; }
   
   string s_disp_d1a = "SD1a";
   ObjectDelete(s_disp_d1a);
   ObjectCreate(s_disp_d1a, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_d1a, DoubleToStr(d1a_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_d1a, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_d1a, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_d1a, OBJPROP_YDISTANCE, 230+Y_distanceGeneral );
   
//*************Arrow code   
   if (d1a_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (d1a_sellers>50 && d1a_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (d1a_sellers<50 && d1a_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (d1a_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (d1a_sellers==50) { Sign="n"; Arr=colorFlat; } 
   if (d1a_buyers==d1a_sellers) { Sign="n"; Arr=colorFlat; }
  
      
   string sign5a = "Daily BBa";
   ObjectDelete(sign5a);
   ObjectCreate(sign5a, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign5a, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign5a, OBJPROP_CORNER, Corner );
   ObjectSet(sign5a, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign5a, OBJPROP_YDISTANCE, 230+Y_distanceGeneral );
      
   // 12 HOURS (11)
   double highest_h8 = iHigh(NULL, PERIOD_M15, iHighest(NULL, PERIOD_M15, MODE_HIGH, 48, 0));
   double lowest_h8  = iLow(NULL, PERIOD_M15, iLowest(NULL, PERIOD_M15, MODE_LOW, 48, 0));
   double h8_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_h8 )/(highest_h8-lowest_h8);
   
   if (h8_buyers>=75) { Col=colorUP2; }
   if (h8_buyers>50 && h8_buyers<75) { Col=colorUP1; }
   if (h8_buyers<50 && h8_buyers>25) { Col=colorDown1; }
   if (h8_buyers<25 ) { Col=colorDown2; }
   if (h8_buyers==50) { Col=colorFlat; }
    
   string b_disp_h8 = "B8H";
   ObjectDelete(b_disp_h8);
   ObjectCreate(b_disp_h8, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_h8, DoubleToStr(h8_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_h8, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_h8, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_h8, OBJPROP_YDISTANCE, 245+Y_distanceGeneral );
   
   highest_h8 = iHigh(NULL, PERIOD_M15, iHighest(NULL, PERIOD_M15, MODE_HIGH, 48, 0));
   lowest_h8  = iLow(NULL, PERIOD_M15, iLowest(NULL, PERIOD_M15, MODE_LOW, 48, 0));
   double h8_sellers=100*(highest_h8-iClose(NULL,PERIOD_M1,0) )/(highest_h8-lowest_h8);
   
   if (h8_sellers>=75) { Col=colorDown2; }
   if (h8_sellers>50 && h8_sellers<75) { Col=colorDown1; }
   if (h8_sellers<50 && h8_sellers>25) { Col=colorUP1; }
   if (h8_sellers<25) { Col=colorUP2; }
   if (h8_sellers==50) { Col=colorFlat; }
   
   string s_disp_h8 = "S8H";
   ObjectDelete(s_disp_h8);
   ObjectCreate(s_disp_h8, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_h8, DoubleToStr(h8_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_h8, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_h8, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_h8, OBJPROP_YDISTANCE, 245+Y_distanceGeneral );
   
//*************Arrow code   
   if (h8_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (h8_sellers>50 && h8_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (h8_sellers<50 && h8_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (h8_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (h8_sellers==50) { Sign="n"; Arr=colorFlat; } 
   if (h8_buyers==h8_sellers) { Sign="n"; Arr=colorFlat; }
  
      
   string sign6 = "12H BB";
   ObjectDelete(sign6);
   ObjectCreate(sign6, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign6, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign6, OBJPROP_CORNER, Corner );
   ObjectSet(sign6, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign6, OBJPROP_YDISTANCE, 245+Y_distanceGeneral );
   
   // 6 HOURS (10)
   double highest_h4 = iHigh(NULL, PERIOD_M5, iHighest(NULL, PERIOD_M5, MODE_HIGH, 72, 0));
   double lowest_h4  = iLow(NULL, PERIOD_M5, iLowest(NULL, PERIOD_M5, MODE_LOW, 72, 0)); 
   double h4_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_h4 )/(highest_h4-lowest_h4);
   
   if (h4_buyers>=75) { Col=colorUP2; } 
   if (h4_buyers>50 && h4_buyers<75) { Col=colorUP1; }
   if (h4_buyers<50 && h4_buyers>25) { Col=colorDown1; }
   if (h4_buyers<25 ) { Col=colorDown2; } 
   if (h4_buyers==50) { Col=colorFlat; }
   
   string b_disp_h4 = "B4H";
   ObjectDelete(b_disp_h4);
   ObjectCreate(b_disp_h4, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_h4, DoubleToStr(h4_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_h4, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_h4, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_h4, OBJPROP_YDISTANCE, 260+Y_distanceGeneral );
   
   highest_h4 = iHigh(NULL, PERIOD_M5, iHighest(NULL, PERIOD_M5, MODE_HIGH, 72, 0));
   lowest_h4  = iLow(NULL, PERIOD_M5, iLowest(NULL, PERIOD_M5, MODE_LOW, 72, 0));
   double h4_sellers=100*(highest_h4-iClose(NULL,PERIOD_M1,0) )/(highest_h4-lowest_h4);
   
   if (h4_sellers>=75) { Col=colorDown2; }
   if (h4_sellers>50 && h4_sellers<75) { Col=colorDown1; }
   if (h4_sellers<50 && h4_sellers>25) { Col=colorUP1; }
   if (h4_sellers<25) { Col=colorUP2; }
   if (h4_sellers==50) { Col=colorFlat; }
   
   string s_disp_h4 = "S4H";
   ObjectDelete(s_disp_h4);
   ObjectCreate(s_disp_h4, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_h4, DoubleToStr(h4_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_h4, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_h4, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_h4, OBJPROP_YDISTANCE, 260+Y_distanceGeneral );
   
//*************Arrow code   
   if (h4_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (h4_sellers>50 && h4_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (h4_sellers<50 && h4_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (h4_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (h4_sellers==50) { Sign="n"; Arr=colorFlat; } 
   if (h4_buyers==h4_sellers) { Sign="n"; Arr=colorFlat; }
    
   
   string sign7 = "6H BB";
   ObjectDelete(sign7);
   ObjectCreate(sign7, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign7, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign7, OBJPROP_CORNER, Corner );
   ObjectSet(sign7, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign7, OBJPROP_YDISTANCE, 260+Y_distanceGeneral );
   
   // 4 HOURS (9)
   double highest_h1a = iHigh(NULL, PERIOD_M5, iHighest(NULL, PERIOD_M5, MODE_HIGH, 48, 0));
   double lowest_h1a  = iLow(NULL, PERIOD_M5, iLowest(NULL, PERIOD_M5, MODE_LOW, 48, 0)); 
   double h1a_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_h1a )/(highest_h1a-lowest_h1a);
   
   if (h1a_buyers>=75) { Col=colorUP2; }
   if (h1a_buyers>50 && h1a_buyers<75) { Col=colorUP1; }
   if (h1a_buyers<50 && h1a_buyers>25) { Col=colorDown1; }
   if (h1a_buyers<25 ) { Col=colorDown2; }
   if (h1a_buyers==50) { Col=colorFlat; }
   
   string b_disp_h1a = "B1Ha";
   ObjectDelete(b_disp_h1a);
   ObjectCreate(b_disp_h1a, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_h1a, DoubleToStr(h1a_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_h1a, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_h1a, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_h1a, OBJPROP_YDISTANCE, 275+Y_distanceGeneral );
   
   highest_h1a = iHigh(NULL, PERIOD_M5, iHighest(NULL, PERIOD_M5, MODE_HIGH, 48, 0));
   lowest_h1a  = iLow(NULL, PERIOD_M5, iLowest(NULL, PERIOD_M5, MODE_LOW, 48, 0)); 
   double h1a_sellers=100*(highest_h1a-iClose(NULL,PERIOD_M1,0) )/(highest_h1a-lowest_h1a);
   
   if (h1a_sellers>=75) { Col=colorDown2; }
   if (h1a_sellers>50 && h1a_sellers<75) { Col=colorDown1; }
   if (h1a_sellers<50 && h1a_sellers>25) { Col=colorUP1; }
   if (h1a_sellers<25) { Col=colorUP2; }
   if (h1a_sellers==50) { Col=colorFlat; }
   
   string s_disp_h1a = "S1Ha";
   ObjectDelete(s_disp_h1a);
   ObjectCreate(s_disp_h1a, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_h1a, DoubleToStr(h1a_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_h1a, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_h1a, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_h1a, OBJPROP_YDISTANCE, 275+Y_distanceGeneral );
   
//*************Arrow code   
   if (h1a_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (h1a_sellers>50 && h1a_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (h1a_sellers<50 && h1a_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (h1a_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (h1a_sellers==50) { Sign="n"; Arr=colorFlat; } 
   if (h1a_buyers==h1a_sellers) { Sign="n"; Arr=colorFlat; }
  
      
   string sign8a = "3H BBa";
   ObjectDelete(sign8a);
   ObjectCreate(sign8a, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign8a, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign8a, OBJPROP_CORNER, Corner );
   ObjectSet(sign8a, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign8a, OBJPROP_YDISTANCE, 275+Y_distanceGeneral );
   
   // 2 HOURS (8)
   double highest_h1b = iHigh(NULL, PERIOD_M5, iHighest(NULL, PERIOD_M5, MODE_HIGH, 24, 0));
   double lowest_h1b  = iLow(NULL, PERIOD_M5, iLowest(NULL, PERIOD_M5, MODE_LOW, 24, 0));
   double h1b_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_h1b )/(highest_h1b-lowest_h1b);
   
   if (h1b_buyers>=75) { Col=colorUP2; }
   if (h1b_buyers>50 && h1b_buyers<75) { Col=colorUP1; }
   if (h1b_buyers<50 && h1b_buyers>25) { Col=colorDown1; }
   if (h1b_buyers<25 ) { Col=colorDown2; }
   if (h1b_buyers==50) { Col=colorFlat; }
   
   string b_disp_h1b = "B1Hb";
   ObjectDelete(b_disp_h1b);
   ObjectCreate(b_disp_h1b, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_h1b, DoubleToStr(h1b_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_h1b, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_h1b, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_h1b, OBJPROP_YDISTANCE, 290+Y_distanceGeneral );
   
   highest_h1b = iHigh(NULL, PERIOD_M5, iHighest(NULL, PERIOD_M5, MODE_HIGH, 24, 0));
   lowest_h1b  = iLow(NULL, PERIOD_M5, iLowest(NULL, PERIOD_M5, MODE_LOW, 24, 0));
   double h1b_sellers=100*(highest_h1b-iClose(NULL,PERIOD_M1,0) )/(highest_h1b-lowest_h1b);
   
   if (h1b_sellers>=75) { Col=colorDown2; }
   if (h1b_sellers>50 && h1b_sellers<75) { Col=colorDown1; }
   if (h1b_sellers<50 && h1b_sellers>25) { Col=colorUP1; }
   if (h1b_sellers<25) { Col=colorUP2; }
   if (h1b_sellers==50) { Col=colorFlat; } 
   
   string s_disp_h1b = "S1Hb";
   ObjectDelete(s_disp_h1b);
   ObjectCreate(s_disp_h1b, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_h1b, DoubleToStr(h1b_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_h1b, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_h1b, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_h1b, OBJPROP_YDISTANCE, 290+Y_distanceGeneral );
   
//*************Arrow code   
   if (h1b_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (h1b_sellers>50 && h1b_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (h1b_sellers<50 && h1b_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (h1b_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (h1b_sellers==50) { Sign="n"; Arr=colorFlat; } 
   if (h1b_buyers==h1b_sellers) { Sign="n"; Arr=colorFlat; }

      
   string sign8b = "3H BBb";
   ObjectDelete(sign8b);
   ObjectCreate(sign8b, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign8b, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign8b, OBJPROP_CORNER, Corner );
   ObjectSet(sign8b, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign8b, OBJPROP_YDISTANCE, 290+Y_distanceGeneral );
      
   // 60 MINUTES  (7)
   double highest_h1 = iHigh(NULL, PERIOD_M1, iHighest(NULL, PERIOD_M1, MODE_HIGH, 60, 0));
   double lowest_h1  = iLow(NULL, PERIOD_M1, iLowest(NULL, PERIOD_M1, MODE_LOW, 60, 0));
   double h1_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_h1 )/(highest_h1-lowest_h1);
   
   if (h1_buyers>=75) { Col=colorUP2; }
   if (h1_buyers>50 && h1_buyers<75) { Col=colorUP1; }
   if (h1_buyers<50 && h1_buyers>25) { Col=colorDown1; }
   if (h1_buyers<25 ) { Col=colorDown2; }
   if (h1_buyers==50) { Col=colorFlat; }
   
   string b_disp_h1 = "B1H";
   ObjectDelete(b_disp_h1);
   ObjectCreate(b_disp_h1, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_h1, DoubleToStr(h1_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_h1, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_h1, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_h1, OBJPROP_YDISTANCE, 305+Y_distanceGeneral );
   
   highest_h1 = iHigh(NULL, PERIOD_M1, iHighest(NULL, PERIOD_M1, MODE_HIGH, 60, 0));
   lowest_h1  = iLow(NULL, PERIOD_M1, iLowest(NULL, PERIOD_M1, MODE_LOW, 60, 0));
   double h1_sellers=100*(highest_h1-iClose(NULL,PERIOD_M1,0) )/(highest_h1-lowest_h1);
   
   if (h1_sellers>=75) { Col=colorDown2; } 
   if (h1_sellers>50 && h1_sellers<75) { Col=colorDown1; }
   if (h1_sellers<50 && h1_sellers>25) { Col=colorUP1; } 
   if (h1_sellers<25) { Col=colorUP2; }
   if (h1_sellers==50) { Col=colorFlat; }
   
   string s_disp_h1 = "S1H";
   ObjectDelete(s_disp_h1);
   ObjectCreate(s_disp_h1, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_h1, DoubleToStr(h1_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_h1, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_h1, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_h1, OBJPROP_YDISTANCE, 305+Y_distanceGeneral );
   
//*************Arrow code   
   if (h1_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (h1_sellers>50 && h1_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (h1_sellers<50 && h1_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (h1_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (h1_sellers==50) { Sign="n"; Arr=colorFlat; } 
   if (h1_buyers==h1_sellers) { Sign="n"; Arr=colorFlat; }

   string sign8 = "3H BB";
   ObjectDelete(sign8);
   ObjectCreate(sign8, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign8, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign8, OBJPROP_CORNER, Corner );
   ObjectSet(sign8, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign8, OBJPROP_YDISTANCE, 305+Y_distanceGeneral );
   
   // 45 MINUTE (6))
   double highest_h1c = iHigh(NULL, PERIOD_M1, iHighest(NULL, PERIOD_M1, MODE_HIGH, 45, 0));
   double lowest_h1c  = iLow(NULL, PERIOD_M1, iLowest(NULL, PERIOD_M1, MODE_LOW, 45, 0));
   double h1c_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_h1c )/(highest_h1c-lowest_h1c);
   
   if (h1c_buyers>=75) { Col=colorUP2; }
   if (h1c_buyers>50 && h1c_buyers<75) { Col=colorUP1; }
   if (h1c_buyers<50 && h1c_buyers>25) { Col=colorDown1; } 
   if (h1c_buyers<25 ) { Col=colorDown2; } 
   if (h1c_buyers==50) { Col=colorFlat; }
   
   string b_disp_h1c = "B1Hc";
   ObjectDelete(b_disp_h1c);
   ObjectCreate(b_disp_h1c, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_h1c, DoubleToStr(h1c_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_h1c, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_h1c, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_h1c, OBJPROP_YDISTANCE, 320+Y_distanceGeneral );
   
   highest_h1c = iHigh(NULL, PERIOD_M1, iHighest(NULL, PERIOD_M1, MODE_HIGH, 45, 0));
   lowest_h1c  = iLow(NULL, PERIOD_M1, iLowest(NULL, PERIOD_M1, MODE_LOW, 45, 0));
   double h1c_sellers=100*(highest_h1c-iClose(NULL,PERIOD_M1,0) )/(highest_h1c-lowest_h1c);
   
   if (h1c_sellers>=75) { Col=colorDown2; }
   if (h1c_sellers>50 && h1c_sellers<75) { Col=colorDown1; }
   if (h1c_sellers<50 && h1c_sellers>25) { Col=colorUP1; }
   if (h1c_sellers<25) { Col=colorUP2; }
   if (h1c_sellers==50) { Col=colorFlat; } 
   
   string s_disp_h1c = "S1Hc";
   ObjectDelete(s_disp_h1c);
   ObjectCreate(s_disp_h1c, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_h1c, DoubleToStr(h1c_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_h1c, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_h1c, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_h1c, OBJPROP_YDISTANCE, 320+Y_distanceGeneral );
   
//*************Arrow code   
   if (h1c_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (h1c_sellers>50 && h1c_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (h1c_sellers<50 && h1c_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (h1c_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (h1c_sellers==50) { Sign="n"; Arr=colorFlat; } 
   if (h1c_buyers==h1c_sellers) { Sign="n"; Arr=colorFlat; }

      
   string sign8c = "3H BBc";
   ObjectDelete(sign8c);
   ObjectCreate(sign8c, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign8c, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign8c, OBJPROP_CORNER, Corner );
   ObjectSet(sign8c, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign8c, OBJPROP_YDISTANCE, 320+Y_distanceGeneral );
   
   // 30 MINUTE (5)
   double highest_m30 = iHigh(NULL, PERIOD_M1, iHighest(NULL, PERIOD_M1, MODE_HIGH, 30, 0));
   double lowest_m30  = iLow(NULL, PERIOD_M1, iLowest(NULL, PERIOD_M1, MODE_LOW, 30, 0)); 
   double m30_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_m30 )/(highest_m30-lowest_m30);
   
   if (m30_buyers>=75) { Col=colorUP2; } 
   if (m30_buyers>50 && m30_buyers<75) { Col=colorUP1; }
   if (m30_buyers<50 && m30_buyers>25) { Col=colorDown1; }
   if (m30_buyers<25 ) { Col=colorDown2; }
   if (m30_buyers==50) { Col=colorFlat; }
   
   string b_disp_m30 = "BM30";
   ObjectDelete(b_disp_m30);
   ObjectCreate(b_disp_m30, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_m30, DoubleToStr(m30_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_m30, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_m30, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_m30, OBJPROP_YDISTANCE, 335+Y_distanceGeneral );
   
   highest_m30 = iHigh(NULL, PERIOD_M1, iHighest(NULL, PERIOD_M1, MODE_HIGH, 30, 0));
   lowest_m30  = iLow(NULL, PERIOD_M1, iLowest(NULL, PERIOD_M1, MODE_LOW, 30, 0)); 
   double m30_sellers=100*(highest_m30-iClose(NULL,PERIOD_M1,0) )/(highest_m30-lowest_m30);
   
   if (m30_sellers>=75) { Col=colorDown2; }
   if (m30_sellers>50 && m30_sellers<75) { Col=colorDown1; }
   if (m30_sellers<50 && m30_sellers>25) { Col=colorUP1; } 
   if (m30_sellers<25) { Col=colorUP2; } 
   if (m30_sellers==50) { Col=colorFlat; } 
   
   string s_disp_m30 = "SM30";
   ObjectDelete(s_disp_m30);
   ObjectCreate(s_disp_m30, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_m30, DoubleToStr(m30_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_m30, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_m30, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_m30, OBJPROP_YDISTANCE, 335+Y_distanceGeneral );
   
//*************Arrow code   
   if (m30_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (m30_sellers>50 && m30_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (m30_sellers<50 && m30_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (m30_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (m30_sellers==50) { Sign="n"; Arr=colorFlat; } 
   if (m30_buyers==m30_sellers) { Sign="n"; Arr=colorFlat; }

      
   string sign9 = "90 mnt BB";
   ObjectDelete(sign9);
   ObjectCreate(sign9, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign9, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign9, OBJPROP_CORNER, Corner );
   ObjectSet(sign9, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign9, OBJPROP_YDISTANCE, 335+Y_distanceGeneral );
   
   
   
   // 15 MINUTE (4)
   double highest_m15 = iHigh(NULL, PERIOD_M1, iHighest(NULL, PERIOD_M1, MODE_HIGH, 15, 0));
   double lowest_m15  = iLow(NULL, PERIOD_M1, iLowest(NULL, PERIOD_M1, MODE_LOW, 15, 0));
   double m15_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_m15 )/(highest_m15-lowest_m15);
   
   if (m15_buyers>=75) { Col=colorUP2; }
   if (m15_buyers>50 && m15_buyers<75) { Col=colorUP1; }
   if (m15_buyers<50 && m15_buyers>25) { Col=colorDown1; }
   if (m15_buyers<25 ) { Col=colorDown2; } 
   if (m15_buyers==50) { Col=colorFlat; }
   
   string b_disp_m15 = "BM15";
   ObjectDelete(b_disp_m15);
   ObjectCreate(b_disp_m15, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_m15, DoubleToStr(m15_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_m15, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_m15, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_m15, OBJPROP_YDISTANCE, 350+Y_distanceGeneral );
   
   highest_m15 = iHigh(NULL, PERIOD_M1, iHighest(NULL, PERIOD_M1, MODE_HIGH, 15, 0));
   lowest_m15  = iLow(NULL, PERIOD_M1, iLowest(NULL, PERIOD_M1, MODE_LOW, 15, 0)); 
   double m15_sellers=100*(highest_m15-iClose(NULL,PERIOD_M1,0) )/(highest_m15-lowest_m15);
   
   if (m15_sellers>=75) { Col=colorDown2; }
   if (m15_sellers>50 && m15_sellers<75) { Col=colorDown1; }
   if (m15_sellers<50 && m15_sellers>25) { Col=colorUP1; }
   if (m15_sellers<25) { Col=colorUP2; } 
   if (m15_sellers==50) { Col=colorFlat; }
   
   string s_disp_m15 = "SM15";
   ObjectDelete(s_disp_m15);
   ObjectCreate(s_disp_m15, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_m15, DoubleToStr(m15_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_m15, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_m15, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_m15, OBJPROP_YDISTANCE, 350+Y_distanceGeneral );
   
//*************Arrow code   
   if (m15_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (m15_sellers>50 && m15_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (m15_sellers<50 && m15_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (m15_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (m15_sellers==50) { Sign="n"; Arr=colorFlat; } 
   if (m15_buyers==m15_sellers) { Sign="n"; Arr=colorFlat; }
  
   string sign10 = "45 mnt BB";
   ObjectDelete(sign10);
   ObjectCreate(sign10, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign10, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign10, OBJPROP_CORNER, Corner );
   ObjectSet(sign10, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign10, OBJPROP_YDISTANCE, 350+Y_distanceGeneral );
   
   // 10 MINUTE (3)
   double highest_m15a = iHigh(NULL, PERIOD_M1, iHighest(NULL, PERIOD_M1, MODE_HIGH, 10, 0));
   double lowest_m15a  = iLow(NULL, PERIOD_M1, iLowest(NULL, PERIOD_M1, MODE_LOW, 10, 0));
   double m15a_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_m15a )/(highest_m15a-lowest_m15a);
   
   if (m15a_buyers>=75) { Col=colorUP2; }
   if (m15a_buyers>50 && m15a_buyers<75) { Col=colorUP1; }
   if (m15a_buyers<50 && m15a_buyers>25) { Col=colorDown1; }
   if (m15a_buyers<25 ) { Col=colorDown2; }
   if (m15a_buyers==50) { Col=colorFlat; } 
   
   string b_disp_m15a = "BM15a";
   ObjectDelete(b_disp_m15a);
   ObjectCreate(b_disp_m15a, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_m15a, DoubleToStr(m15a_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_m15a, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_m15a, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_m15a, OBJPROP_YDISTANCE, 365+Y_distanceGeneral );
   
   highest_m15a = iHigh(NULL, PERIOD_M1, iHighest(NULL, PERIOD_M1, MODE_HIGH, 10, 0));
   lowest_m15a  = iLow(NULL, PERIOD_M1, iLowest(NULL, PERIOD_M1, MODE_LOW, 10, 0)); 
   double m15a_sellers=100*(highest_m15a-iClose(NULL,PERIOD_M1,0) )/(highest_m15a-lowest_m15a);
   
   if (m15a_sellers>=75) { Col=colorDown2; } 
   if (m15a_sellers>50 && m15a_sellers<75) { Col=colorDown1; }
   if (m15a_sellers<50 && m15a_sellers>25) { Col=colorUP1; } 
   if (m15a_sellers<25) { Col=colorUP2; } 
   if (m15a_sellers==50) { Col=colorFlat; }
   
   string s_disp_m15a = "SM15a";
   ObjectDelete(s_disp_m15a);
   ObjectCreate(s_disp_m15a, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_m15a, DoubleToStr(m15a_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_m15a, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_m15a, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_m15a, OBJPROP_YDISTANCE, 365+Y_distanceGeneral );
   
//*************Arrow code   
   if (m15a_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (m15a_sellers>50 && m15a_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (m15a_sellers<50 && m15a_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (m15a_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (m15a_sellers==50) { Sign="n"; Arr=colorFlat; } 
   if (m15a_buyers==m15a_sellers) { Sign="n"; Arr=colorFlat; } 

      
   string sign10a = "45 mnt BBa";
   ObjectDelete(sign10a);
   ObjectCreate(sign10a, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign10a, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign10a, OBJPROP_CORNER, Corner );
   ObjectSet(sign10a, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign10a, OBJPROP_YDISTANCE, 365+Y_distanceGeneral );
   
   // 5 MINUTE TF (2)
   double highest_m15ab = iHigh(NULL, PERIOD_M1, iHighest(NULL, PERIOD_M1, MODE_HIGH, 5, 0));
   double lowest_m15ab  = iLow(NULL, PERIOD_M1, iLowest(NULL, PERIOD_M1, MODE_LOW, 5, 0)); 
   double m15ab_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_m15ab )/(highest_m15ab-lowest_m15ab);
   
   if (m15ab_buyers>=75) { Col=colorUP2; }
   if (m15ab_buyers>50 && m15ab_buyers<75) { Col=colorUP1; }
   if (m15ab_buyers<50 && m15ab_buyers>25) { Col=colorDown1; } 
   if (m15ab_buyers<25 ) { Col=colorDown2; }
   if (m15ab_buyers==50) { Col=colorFlat; }
   
   string b_disp_m15ab = "BM15ab";
   ObjectDelete(b_disp_m15ab);
   ObjectCreate(b_disp_m15ab, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_m15ab, DoubleToStr(m15ab_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_m15ab, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_m15ab, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_m15ab, OBJPROP_YDISTANCE, 380+Y_distanceGeneral );
   
   highest_m15ab = iHigh(NULL, PERIOD_M1, iHighest(NULL, PERIOD_M1, MODE_HIGH, 5, 0));
   lowest_m15ab  = iLow(NULL, PERIOD_M1, iLowest(NULL, PERIOD_M1, MODE_LOW, 5, 0));
   double m15ab_sellers=100*(highest_m15ab-iClose(NULL,PERIOD_M1,0) )/(highest_m15ab-lowest_m15ab);
   
   if (m15ab_sellers>=75) { Col=colorDown2; }
   if (m15ab_sellers>50 && m15ab_sellers<75) { Col=colorDown1; }
   if (m15ab_sellers<50 && m15ab_sellers>25) { Col=colorUP1; }
   if (m15ab_sellers<25) { Col=colorUP2; }
   if (m15ab_sellers==50) { Col=colorFlat; }
   
   string s_disp_m15ab = "SM15ab";
   ObjectDelete(s_disp_m15ab);
   ObjectCreate(s_disp_m15ab, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_m15ab, DoubleToStr(m15ab_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_m15ab, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_m15ab, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_m15ab, OBJPROP_YDISTANCE, 380+Y_distanceGeneral );
   
//*************Arrow code   
   if (m15ab_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (m15ab_sellers>50 && m15ab_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (m15ab_sellers<50 && m15ab_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (m15ab_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (m15ab_sellers==50) { Sign="n"; Arr=colorFlat; }
   if (m15ab_buyers==m15ab_sellers) { Sign="n"; Arr=colorFlat; } 
   
   
   string sign10ab = "45 mnt BBab";
   ObjectDelete(sign10ab);
   ObjectCreate(sign10ab, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign10ab, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign10ab, OBJPROP_CORNER, Corner );
   ObjectSet(sign10ab, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign10ab, OBJPROP_YDISTANCE, 380+Y_distanceGeneral );
   
     // 1 MINUTE TF (1)
   double highest_m1aa = iHigh(NULL, PERIOD_M1, iHighest(NULL, PERIOD_M1, MODE_HIGH, 2, 0));
   double lowest_m1aa  = iLow(NULL, PERIOD_M1, iLowest(NULL, PERIOD_M1, MODE_LOW, 2, 0)); 
   double m1aa_buyers=100*(iClose(NULL,PERIOD_M1,0)-lowest_m1aa )/(highest_m1aa-lowest_m1aa);
   
   if (m1aa_buyers>=75) { Col=colorUP2; }
   if (m1aa_buyers>50 && m1aa_buyers<75) { Col=colorUP1; }
   if (m1aa_buyers<50 && m1aa_buyers>25) { Col=colorDown1; } 
   if (m1aa_buyers<25 ) { Col=colorDown2; }
   if (m1aa_buyers==50) { Col=colorFlat; }
   
   string b_disp_m1aa = "BM1";
   ObjectDelete(b_disp_m1aa);
   ObjectCreate(b_disp_m1aa, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(b_disp_m1aa, DoubleToStr(m1aa_buyers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(b_disp_m1aa, OBJPROP_CORNER, Corner );
   ObjectSet(b_disp_m1aa, OBJPROP_XDISTANCE, BuyX_Shift+X_distanceGeneral );
   ObjectSet(b_disp_m1aa, OBJPROP_YDISTANCE, 395+Y_distanceGeneral );
   
   highest_m1aa = iHigh(NULL, PERIOD_M1, iHighest(NULL, PERIOD_M1, MODE_HIGH, 2, 0));
   lowest_m1aa  = iLow(NULL, PERIOD_M1, iLowest(NULL, PERIOD_M1, MODE_LOW, 2, 0));
   double m1aa_sellers=100*(highest_m1aa-iClose(NULL,PERIOD_M1,0) )/(highest_m1aa-lowest_m1aa);
   
   if (m1aa_sellers>=75) { Col=colorDown2; }
   if (m1aa_sellers>50 && m1aa_sellers<75) { Col=colorDown1; }
   if (m1aa_sellers<50 && m1aa_sellers>25) { Col=colorUP1; }
   if (m1aa_sellers<25) { Col=colorUP2; }
   if (m1aa_sellers==50) { Col=colorFlat; }
   
   string s_disp_m1aa = "SM1";
   ObjectDelete(s_disp_m1aa);
   ObjectCreate(s_disp_m1aa, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(s_disp_m1aa, DoubleToStr(m1aa_sellers,DecimalNumbers) ,fontSizeSignal, fontSignal, Col);
   ObjectSet(s_disp_m1aa, OBJPROP_CORNER, Corner );
   ObjectSet(s_disp_m1aa, OBJPROP_XDISTANCE, SellX_Shift+X_distanceGeneral );
   ObjectSet(s_disp_m1aa, OBJPROP_YDISTANCE, 395+Y_distanceGeneral );
   
//*************Arrow code   
   if (m1aa_sellers>=75) { Sign="q"; Arr=colorDown2; }
   if (m1aa_sellers>50 && m1aa_sellers<75) { Sign="q"; Arr=colorDown1; }
   if (m1aa_sellers<50 && m1aa_sellers>25) { Sign="p"; Arr=colorUP1; }
   if (m1aa_sellers<25) { Sign="p"; Arr=colorUP2; }
   if (m1aa_sellers==50) { Sign="n"; Arr=colorFlat; } 
   if (m1aa_buyers==m1aa_sellers) { Sign="n"; Arr=colorFlat; }

      
   string sign5aa = "ZM1";
   ObjectDelete(sign5aa);
   ObjectCreate(sign5aa, OBJ_LABEL, 0, 0, 0 );
   ObjectSetText(sign5aa, Sign ,ArrowSize , "Wingdings 3", Arr);
   ObjectSet(sign5aa, OBJPROP_CORNER, Corner );
   ObjectSet(sign5aa, OBJPROP_XDISTANCE, ArrowX_Shift+X_distanceGeneral );
   ObjectSet(sign5aa, OBJPROP_YDISTANCE, 395+Y_distanceGeneral );
                                                                                                                                                                                                    
   return(0);
  }
//+------------------------------------------------------------------+