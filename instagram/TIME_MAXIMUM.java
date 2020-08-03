package instagram;

import java.util.Date;

public class TIME_MAXIMUM {
	  public static final int SEC = 60;
      public static final int MIN = 60;
      public static final int HOUR = 24;
      public static final int DAY = 30;
      public static final int MONTH = 12;
      public static final int YEAR = 1;



      public String calculateTime(Date date)
      {

          long curTime = System.currentTimeMillis();
          long regTime = date.getTime();
          long diffTime = (curTime - regTime) / 1000;

          String msg = null;

          if (diffTime < TIME_MAXIMUM.SEC)
          {
              // sec
              msg = diffTime + "����";
          }
          else if ((diffTime /= TIME_MAXIMUM.SEC) < TIME_MAXIMUM.MIN)
          {
              // min
              System.out.println(diffTime);
             
              msg = diffTime + "����";
          }
          else if ((diffTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.HOUR)
          {
              // hour
              msg = (diffTime ) + "�ð���";
          }
          else if ((diffTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.DAY)
          {
              // day
              msg = (diffTime ) + "����";
          }
          else if ((diffTime /= TIME_MAXIMUM.DAY) < TIME_MAXIMUM.MONTH)
          {
              // day
              msg = (diffTime ) + "����";
          }
          else if((diffTime /= TIME_MAXIMUM.MONTH) < TIME_MAXIMUM.YEAR)
          {
              msg = (diffTime) + "����";
          }
          System.out.println("msg");
          return msg;
      }
  
      
}

