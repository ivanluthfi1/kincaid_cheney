C
C PAGE 352-354: NUMERICAL MATHEMATICS AND COMPUTING, CHENEY/KINCAID, 1985
C
C FILE: BRTHDY.FOR
C
C BIRTHDAY PROBLEM SIMULATION (PROB,BRTHDY,RANDOM)
C
C   REPEATED BIRTHDAY PROBLEM - SUPPOSE THERE ARE N PEOPLE IN A ROOM. 
C   WHAT IS THE PROBABILITY THAT ANY TWO OF THESE PEOPLE WILL HAVE THE
C   SAME BIRTHDAY.  USING A RANDOM NUMBER GENERATOR TO SIMULATE 
C   BIRTHDAYS, THIS PROGRAM CALCULATES THE PROBABILITY OF REPEATED
C   BIRTHDAYS 
C
      L = 256     
      DO 2 N = 5,55,5 
      IF(N .EQ. 25) THEN    
        DO 3 K = 22,23
        VALUE = PROB(K,L) 
        PRINT *,'PROBABILITY AT', K,' IS ',VALUE
   3  CONTINUE
        END IF
      VALUE = PROB(N,L)     
      PRINT *,'PROBABILITY AT ', N,' IS ',VALUE 
   2  CONTINUE
      STOP
      END 
  
      REAL FUNCTION  PROB(N,L)
      LOGICAL  BRTHDY,COINCD
      DATA  M/1000/ 
      SUM = 0.0 
      DO 2 I = 1,M
        COINCD = BRTHDY(N,L)
        IF (COINCD)  SUM = SUM + 1.0  
   2  CONTINUE    
      PROB = SUM/REAL(M)    
      RETURN
      END 
  
      LOGICAL FUNCTION  BRTHDY(N,L)   
      LOGICAL  DAYS(365)    
      DO 2 I = 1,365
        DAYS(I) = .FALSE.   
   2  CONTINUE    
      DO 3 I = 1,N
        NUMBER = 365.0*RANDOM(L) + 1.0
        IF(DAYS(NUMBER))  THEN
          BRTHDY = .TRUE.   
          RETURN
        END IF
        DAYS(NUMBER) = .TRUE. 
   3  CONTINUE    
      BRTHDY = .FALSE.      
      RETURN
      END 
  
      FUNCTION RANDOM(L)
      L = MOD(16807*L,2147483647)
      RANDOM = REAL(L)*4.6566128752458E-10      
      RETURN
      END 