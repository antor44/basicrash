10 REM *** BasiCrash v. 1.06 ***
15 REM GNU General Public License v3.0 or later
20 DEFINT A-Z:DIM ST%(36,21)
30 KEY OFF
100 SCREEN 0,,0:LOCATE 0,22,0:PRINT "SCORE:":LOCATE 9,22,0:PRINT RE
110 FOR Y=1 TO 21
120 FOR X=0 TO 36
130 ST%(X,Y)=32
140 NEXT X
150 NEXT Y
160 FOR X=1 TO 30
170 A=INT(RND(1)*35)+1:B=INT(RND(1)*21)+1
180 IF ST%(A,B)<>32 OR (ST%(A+1,B)=42 AND (ST%(A-1,B)=42 OR ST%(A,B-1)=42 OR ST%(A+1,B-1)=42)) GOTO 170 ELSE ST%(A,B)=111
190 A=INT(RND(1)*34)+2:B=INT(RND(1)*21)+1
200 IF ST%(A,B)<>32 OR (ST%(A-1,B)=111 AND (ST%(A-2,B)=42 OR ST%(A-1,B-1)=42 OR ST%(A,B-1)=42)) GOTO 190
210 IF B=21 AND ST%(A,B-1)=42 GOTO 190
220 IF B=20 THEN IF ST%(A,B+1)=42 GOTO 190
230 IF B<21 THEN IF (ST%(A,B-1)=42 AND ST%(A,B+1)=42) GOTO 190
240 IF B<20 THEN IF (ST%(A,B+1)=42 AND ST%(A,B+2)=42) GOTO 190
250 IF B>1 THEN IF (ST%(A,B-1)=42 AND ST%(A,B-2)=42) GOTO 190
260 ST%(A,B)=42
270 NEXT X
300 FOR Y=1 TO 21
310 T$=INKEY$
320 FOR X=0 TO 36
330 LOCATE X,Y,0: PRINT CHR$(ST%(X,Y))
340 NEXT X
350 NEXT Y
360 F=0:G=0:M=0:N=0:P=0
400 LOCATE F,G,0:PRINT CHR$(32):LOCATE M,N,0:PRINT CHR$(62)
410 F=M:G=N
420 FOR X=1 TO 80:NEXT X
430 T$=INKEY$
440 IF T$="" GOTO 470
450 IF T$=CHR$(31) AND N<21 THEN N=N+1
460 IF T$=CHR$(30) AND N>0 THEN N=N-1
470 M=M+1
480 IF M>36 THEN M=0:IF N<21 THEN N=N+1
490 IF ST%(M,N)=111 THEN ST%(M,N)=0:P=P+1 ELSE 510
500 LOCATE 9,22,0:PRINT RE+P:IF P=30 THEN RE=RE+30:GOTO 100
510 IF ST%(M,N)<>42 GOTO 400
520 RE=0:P=0
530 LOCATE 15,10,0:PRINT "GAME OVER"
540 LOCATE 9,13,0:PRINT "Press ENTER to restart"
560 T$=INPUT$(1)
570 IF T$=CHR$(13) GOTO 100 ELSE 560

