.model small        

.data
 nam db "                               **E-LIBRARIAN**",0ah,0dh,0ah,0dh,'$'     
 nl db 0ah,0dh,'$' 
 msg1 db "** Welcome to our books recommendaton system **",0ah,0ah,0dh,"$"
 msg2 db "-> We will recommend books according to how do you feel.",0ah,0dh,"$"                                           
 line db 0ah,0dh,"________________________________________________________________",0ah,0ah,0dh,"$"
 msg3 db "->please, press ok and then answer the questions.",0ah,0ah,0dh,"   1-Ok",0ah,0dh,"   2-Exit",0ah,"$"  
 ques db "->How do you feel now?",0ah,0ah,0dh,"   1-Bored.",0ah,0dh,"   2-Sad.",0ah,0dh,"   3-Excited.",0ah,0dh,"   4-Hungry.",0ah,0dh,"   5-Happy.",0ah,0dh,"   6-Inspired.",0ah,"$"   
 msg4 db "These categories are recommended for you, choose your favourite category.",0ah,0ah,0dh,"$"   
 msg5 db "   (a)Action and adventure.",0ah,0dh,"   (b)Mystery.",0ah,"$" 
 msg6 db "   (a)Spiritual.",0ah,0dh,"   (b)comedy.",0ah,"$" 
 msg7 db "   (a)Thrillers.",0ah,0dh,"   (b)Horror.",0ah,"$" 
 msg8 db "   (a)Health/Fitness.",0ah,0dh,"   (b)cook books.",0ah,"$" 
 msg9 db "   (a)Fantasy.",0ah,0dh,"   (b)Romance.",0ah,"$"
 msg10 db "   (a)spiritual.",0ah,0dh,"   (b)science.",0ah,"$"
 level db "->please, choose your level.",0ah,0ah,0dh,"   1-Beginner.",0ah,0dh,"   2-intermediate.",0ah,0dh,"   3-Advanced.",0ah,"$" 
 msg db 0ah,0dh,"This choice is not available","$" 
 msg11 db "This book is recommended for you, enjoy.",0ah,0ah,0dh,"$"
 msg12 db 0ah,0dh,"1-Back                     2-Exit$"
 ;science
 A db '   The Theory Of Everything$' 
 B db '   A Brief History of Time$' 
 C db '   Relativity$'  
 D db '   Quantum Physics$'
 E db '   The Selfish Gene$'   
 F db '   Science and Life$'     
 G db '   Silent Spring$'    
 H db '   The God Equation$'     
 I db '   Breath$'
 J db '   Other Minds$'
 K db '   Cosmos$'
 L db '   The Demon-Haunted World$'
 ;spriti 
 M db '   The Power of Now$'
 N db '   The Secret$'
 O db '   Lighter$'
 P db '   The Book of Awakening$'
 Q db '   Waking Up$'
 R db "   The Art of Happiness$"
 S db '   Be As You Are$' 
 ;fantasy
 bo1 db '   The Buried Giant$'
 bo2 db '   Witchmark$'
 bo3 db '   A Darker Shade of Magic$'
 bo4 db '   The Blue Elephant$'
 bo5 db '   Paranormal$'
 bo6 db '   The Last Unicorn$'
 bo7 db '   Room Tales 207$'
 bo8 db '   Land of Zicola$'
 bo9 db '   Laws of Jartin$'          
 ;romance
 boo1 db '   Hepta$'
 boo2 db '   Ugly Love$'
 boo3 db '   If You Could See the Sun$'
 boo4 db '   Built to Last$'
 boo5 db '   Before I Do$'
 boo6 db '   A Scatter of Light$'
 boo7 db '   The Lost Melody$'
 boo8 db '   A Curse of Queens$'
 boo9 db '   The Color of Ice$'
 ;health
 M1 db '   Eat to Live$'
 M2 db '   It Starts with Food$'
 M3 db '   Good Calories, Bad Calories$'
 M4 db '   Why We Get Fat$'
 M5 db '   Fast Food Nation$'
 M6 db '   Mindless Eating$'
 ;cook
 c1 db '   On Food and Cooking$'
 c2 db '   100 Cookies$'
 c3 db '   The Joy of Cooking$'
 c4 db '   The Pasta Queen$'
 c5 db '   The Roasting Tin$'
 c6 db '   The Food Lab$'
 ;thrill
 x1 db '   The Guest List$'
 x2 db '   The Girl on the Train$'
 x3 db '   Diamond Dust$'
 x4 db '   The Da Vinci Code$'
 x5 db '   The Lost Symbol$'
 x6 db '   Origin$'
 ;horror
 w1 db '   The Hunger$'
 w2 db '   Beloved$'
 w3 db '   Carmilla$'
 w4 db '   The Outsider$'
 w5 db '   Come Closer$'
 w6 db '   The Silence of the Lambs$'
 ;comedy
 z1 db '   Born a Crime$'
 z2 db '   Lamb$'
 z3 db '   A Confederacy of Dunces$'
 z4 db '   Catch-22$'
 z5 db '   Hyperbole and a Half$'
 z6 db '   Such A Fun Age$'
 ;action
 v1 db '   No Plan B$'
 v2 db '   Fire & Blood$'
 v3 db '   The Lost Metal$'
 v4 db '   Desert Star$'
 v5 db '   The Hobbit$'
 v6 db '   Long Shadows$'
 ;mystery
 h1 db '   The Silent Patient$'
 h2 db '   Livid$'
 h3 db '   The Maze$'
 h4 db '   Racing the Light$'
 h5 db '   Double Vision$'
 h6 db '   The Ghostly Grounds$'   
.code

print proc near  
     mov ah,09h
     int 21h
     ret
    print endp
    
ex:
exit proc near
      mov ah,4ch
      int 21h
      ret
      exit endp

read proc near
     mov ah,01h
     int 21h
     ret
     read endp

     clear proc near
    mov ah,00h
    mov al,02h
    int 10h
    ret
    clear endp

rand proc near
 rands:
 mov ah, 2ch
 int 21h 
 
 mov bh, 57 
 mov ah, dl 
 cmp ah, bh  
 ja rands  
 mov bh, 49 
 mov ah, dl
 cmp ah, bh  
 jb rands  
 ret
 rand endp
 
 
 back proc near
    lea dx,msg12
    call print
    
    call read
    cmp al,'1' ;back
    je OK
    jmp ex
    ret
    back endp

main proc far                                                                       
     mov ax,@data
     mov ds,ax 
     
     lea dx,nam
     call print
     
     lea dx,msg1
     call print
     
     lea dx,msg2
     call print
    
     lea dx,line
     call print 
     
     lea dx,msg3
     call print  
     
     call read 
 
;to make sure that the input is an available choice    
     mov cx,2
   l1:
     mov bl,al
     cmp bl,'1'
     jne  lab1
     jmp OK 
     lab1:
     mov bl,al
     cmp bl,'2'
     jne lab2
     jmp  ex
     
     lab2:
     lea dx,msg    
     call print 
     
     call read
         
   loop l1
             
     call exit      
     
 OK:
     call clear
         
     lea dx,ques
     call print    
     
     call read  
     
;to make sure that the input is an available choice
   mov cx,2
   l2:  
     mov bl,al
     cmp bl,'1' 
     jne lbl1
     jmp bored 
     lbl1:
     cmp bl,'2'
     jne lbl2
     jmp sad 
     lbl2:
     cmp bl,'3'
     jne lbl3
     jmp excit
     lbl3:
     cmp bl,'4'
     jne lbl4
     jmp hungry 
     lbl4:
     cmp bl,'5'
     jne lbl5
     jmp happy
     lbl5:
     cmp bl,'6'
     je inspired
 
     lea dx,msg
     call print 
 
     call read
     
   loop l2
 
   jmp exit
                       
 inspired:
        call clear
     
        lea dx,msg4
        call print 
     
        lea dx,msg10
        call print  
 
        call read
         
;to make sure that the input is an available choice         
        mov cx,2
        l3:
             mov bl,al
             cmp bl, 'a'
             jne lab3
             jmp  spi
             
             lab3:
             cmp bl,'b'
             je science
             
             lea dx,msg
             call print
             
             call read
         
        loop l3
         
        call exit
        
       science:
           lea dx,line    
           mov ah,09h
           int 21h
           
           lea dx,level    
           mov ah,09h
           int 21h
           
           mov ah,01h
           int 21h
               
;to make sure that the input is an available choice              
          mov cx,2
          l4:
               mov bl,al
               cmp bl, '1'
               je  begin1
         
               cmp bl,'2'
               je intermed1
               
               cmp bl,'3'
               jne lab4
               jmp advnc1 
               
               lab4:
               lea dx,msg
               call print
         
               call read
               
          loop l4 
               
          call exit 
              
          begin1:
              call clear 
              
              call rand
              
              cmp dl,36h
              je a1
              
              cmp dl,39h
              je b1
                     
              cmp dl,33h 
              jne cc1    
              
              cmp dl,35h
              je f1
                            
              jmp d1               
              
              a1:
                lea dx,msg11
                call print
                
                lea dx,A
                call print
              
                call back
               
               b1:
                lea dx,msg11
                call print
                
                lea dx,B
                call print
              
                call back
              
              cc1:
                lea dx,msg11
                call print
                
                lea dx,C
                call print
              
                call back
                
              d1:
                lea dx,msg11
                call print
                
                lea dx,D
                call print
                    
                call back
                                 
          intermed1:
              
              call clear 
              
              call rand
              
              cmp dl,31h
              je e1
              
              
              cmp dl,35h
              je f1
              
               cmp dl,39h
              je d1
              
              cmp dl,37h
              je g1           
              
              jmp hh1
              
              e1:
                lea dx,msg11
                call print
                
                lea dx,E
                call print
              
                call back 
              
              f1:
                lea dx,msg11
                call print
                
                lea dx,F1
                call print
              
                call back
              
              g1:
                lea dx,msg11
                call print
                
                lea dx,G
                call print
              
                call back
              
              hh1:
                lea dx,msg11
                call print
              
                lea dx,H
                call print
          
                call back  
                    
          advnc1:
                  
              call clear 
          
              call rand
              
              cmp dl,31h
              je i1
                           
              cmp dl,35h
              je j1
                        
              cmp dl,37h
              je k1   
              
              cmp dl,38h
              je hh1
                                          
              jmp ll1
                                          
              i1:
                lea dx,msg11
                call print
                
                lea dx,I
                call print
              
                call back 
              
              j1:
                lea dx,msg11
                call print
                
                lea dx,J
                call print
              
                call back
              
              k1:
                lea dx,msg11
                call print
                
                lea dx,K
                call print
              
                call back
              
              ll1:
                lea dx,msg11
                call print
                
                lea dx,L
                call print
          
                call back
     
 happy:
        call clear
         
        lea dx,msg4
        call print 
         
        lea dx,msg9
        call print  
         
        call read
        
;to make sure that the input is an available choice         
        mov cx,2
        l5: 
             mov bl,al
             cmp bl, 'a'
             je  fantasy
             
             cmp bl,'b'
             jne lab5
             jmp romance 
             
             lab5:
             lea dx,msg
             call print
             
             call read
        
        loop l5
        call exit 
         
        fantasy:  
           lea dx,line    
           call print
           
           lea dx,level    
           call print
           
           call read
           
           mov cx,2
           l6: 
               mov bl,al
               cmp bl, '1'
               je  begin2
         
               cmp bl,'2'
               je intermed2
               
               cmp bl,'3'
               jne lab6
               jmp advnc2
               
               lab6:
               lea dx,msg
               call print
         
               call read
           
           loop l6
           call exit
              
          begin2:          
              call clear 
              
              call rand
              
              cmp dl,38h
              je Ff1
              
              cmp dl,32h
              je F2  
              
              cmp dl,34h
              je F6
          
              cmp dl,35h
              je F3
            
              jmp F4
               
              Ff1:
                lea dx,msg11
                call print
                
                lea dx,bo1
                call print
              
                call back
              
              F2:
                lea dx,msg11
                call print
                
                lea dx,bo2
                call print
              
                call back
              
              F3:
                lea dx,msg11
                call print
                
                lea dx,bo3
                call print
              
                call back
                 
              F4:
                lea dx,msg11
                call print
                
                lea dx,bo4
                call print
              
                call back   
           
          intermed2:           
                call clear 
              
                call rand
              
                cmp dl,38h
                je F4
                            
                cmp dl,32h
                je F5
                        
                cmp dl,35h
                je F6 
                
                cmp dl,30h
                je F3
                            
                jmp F7
                             
               F5:
                lea dx,msg11
                call print
                
                lea dx,bo5
                call print
              
                call back
              
               F6:
                lea dx,msg11
                call print
                
                lea dx,bo6
                call print
              
                call back
              
               F7:
                lea dx,msg11
                call print
                
                lea dx,bo7
                call print
              
                call back
                            
          advnc2:              
                call clear 
              
                call rand
              
                cmp dl,38h
                je F7
              
                cmp dl,32h
                je F8
              
                jmp F9
               
               F8:
                lea dx,msg11
                call print
                
                lea dx,bo8
                call print
              
                call back
              
               F9:
                lea dx,msg11
                call print
                
                lea dx,bo9
                call print
              
                call back
                  
        romance:
           lea dx,line    
           call print
           
           lea dx,level    
           call print
           
           call read
              
           mov cx,2
           l7:
               mov bl,al
               cmp bl, '1'
               je  begin3
         
               cmp bl,'2'
               je intermed3
               
               cmp bl,'3'
               jne lab7
               jmp advnc3
               
               lab7:
               lea dx,msg
               call print
         
               call read
               
           loop l7
           call exit
             
           begin3:
               call clear 
              
               call rand
                  
               cmp dl,37h
               je q1
                                    
               cmp dl,31h
               je q2      
               
                cmp dl,35h
                je q5
                                            
               jmp q3
                                     
               q1:
                lea dx,msg11
                call print
                
                lea dx,boo1
                call print
              
                call back
              
               q2:
                lea dx,msg11
                call print
                
                lea dx,boo2
                call print
              
                call back
              
               q3:
                lea dx,msg11
                call print
                
                lea dx,boo3
                call print
              
                call back
               
           intermed3:
                call clear 
                  
                call rand
                  
                cmp dl,33h
                je q4
                                    
                cmp dl,38h
                je q5 
                
                cmp dl,36h
                je q2
                  
                jmp q6
                                     
                q4:
                 lea dx,msg11
                 call print
                
                 lea dx,boo4
                 call print
                
                 call back
                  
                q5:
                 lea dx,msg11
                 call print
                
                 lea dx,boo5
                 call print
                  
                 call back
                   
                q6:
                 lea dx,msg11
                 call print
                
                 lea dx,boo6
                 call print
              
                 call back
               
           advnc3:
                call clear 
                  
                call rand
                  
                cmp dl,36h
                je q7
                                    
                cmp dl,33h
                je q8 
                
                cmp dl,39h
                je q5
                  
                jmp q9
                    
                q7:
                 lea dx,msg11
                 call print
                    
                 lea dx,boo7
                 call print
                  
                 call back
                  
                q8:
                 lea dx,msg11
                 call print
                    
                 lea dx,boo8
                 call print
                  
                 call back
                  
                q9:
                 lea dx,msg11
                 call print
                    
                 lea dx,boo9
                 call print
                  
                 call back                  
             
 hungry: 
        call clear
         
        lea dx,msg4
        call print 
         
        lea dx,msg8
        call print  
         
        call read
                
        mov cx,2
        l8: 
             mov bl,al
             cmp bl, 'a'
             je  health
             
             cmp bl,'b'
             jne lab8
             jmp cook
             
             lab8:
             lea dx,msg
             call print
             
             call read
        
        loop l8
        
        call exit 
         
        health: 
             lea dx,line    
             call print
               
             lea dx,level    
             call print
               
             call read
              
             mov cx,2
             l9: 
                 mov bl,al
                 cmp bl, '1'
                 je  begin4
         
                 cmp bl,'2'
                 je intermed4
               
                 cmp bl,'3'
                 jne lab9
                 jmp advnc4
                 
                 lab9:
                 lea dx,msg
                 call print
         
                 call read
              
             loop l9
              
             call exit
              
             begin4:
                  call clear 
                  
                  call rand
                  
                  cmp dl,35h
                  je y1
                                    
                  cmp dl,31h
                  je y2
                  
                  cmp dl,38h
                  je y5
                  
                  jmp y3
                    
                  y1:
                   lea dx,msg11
                   call print
                    
                   lea dx,M1
                   call print
                  
                   call back
                  
                  y2:
                   lea dx,msg11
                   call print
                    
                   lea dx,M2
                   call print
                  
                   call back
                  
                  y3:
                   lea dx,msg11
                   call print
                    
                   lea dx,M3
                   call print
                   
                   call back
               
             intermed4:
                  call clear 
                  
                  call rand
                  
                  cmp dl,36h
                  je y4
                                    
                  cmp dl,30h
                  je y5 
                  
                  cmp dl,39h
                  je y1
                  
                  jmp y6
                    
                  y4:
                   lea dx,msg11
                   call print
                    
                   lea dx,M4
                   call print
                  
                   call back
                  
                  y5:
                   lea dx,msg11
                   call print
                    
                   lea dx,M5
                   call print
                  
                   call back
               
             advnc4:
                  call clear 
                  
                  call rand
                  
                  cmp dl,36h
                  je y6
                                    
                  cmp dl,30h
                  je y2 
                  
                  cmp dl,34h
                  je y1
                  
                  jmp y4
                    
                  y6:
                   lea dx,msg11
                   call print
                    
                   lea dx,M6
                   call print
                  
                   call back
                
        cook:
             lea dx,line    
             call print
               
             lea dx,level    
             call print
               
             call read
                            
             mov cx,2
             l10:
                   mov bl,al
                   cmp bl, '1'
                   je  begin5
             
                   cmp bl,'2'
                   je intermed5
                   
                   cmp bl,'3'
                   jne lab10
                   jmp advnc5
                   
                   lab10:
                   lea dx,msg
                   call print
             
                   call read
              
             loop l10
              
             call exit
              
             begin5:
                  call clear 
                  
                  call rand
                  
                  cmp dl,35h
                  je gg1
                                    
                  cmp dl,31h
                  je g2
                  
                  cmp dl,38h
                  je g3
                  
                  jmp g4
                    
                  gg1:
                   lea dx,msg11
                   call print
                    
                   lea dx,c1
                   call print
                  
                   call back
                  
                  g2:
                   lea dx,msg11
                   call print
                    
                   lea dx,c2
                   call print
                  
                   call back
                  
                  g3:
                   lea dx,msg11
                   call print
                    
                   lea dx,c3
                   call print
                   
                   call back
               
             intermed5:
                  call clear 
                  
                  call rand
                  
                  cmp dl,35h
                  je g4
                                    
                  cmp dl,31h
                  je g5
                  
                  cmp dl,38h
                  je g6
                  
                  jmp g3
                  
                  g4:
                   lea dx,msg11
                   call print
                    
                   lea dx,c4
                   call print
                   
                   call back
                    
                  g5:
                   lea dx,msg11
                   call print
                    
                   lea dx,c5
                   call print
                  
                   call back
                  
                  g6:
                   lea dx,msg11
                   call print
                    
                   lea dx,c6
                   call print
                  
                   call back
               
             advnc5:
                  call clear 
                  
                  call rand
                  
                  cmp dl,30h
                  je g2
                                    
                  cmp dl,32h
                  je g4
                  
                  cmp dl,37h
                  je g5
                  
                  jmp g6
     
 excit:
        call clear
         
        lea dx,msg4
        call print 
         
        lea dx,msg7
        call print  
         
        call read
                
        mov cx,2
        l11:         
             mov bl,al
             cmp bl, 'a'
             je  thrill
             
             cmp bl,'b'
             jne lab11
             jmp horror 
             
             lab11:
             lea dx,msg
             call print
             
             call read  
         
        loop l11  
        
        call exit
         
        thrill: 
               lea dx,line    
               call print
               
               lea dx,level    
               call print
               
               call read
               
               mov cx,2
               l12:              
                   mov bl,al
                   cmp bl, '1'
                   je  begin6
             
                   cmp bl,'2'
                   je intermed6
                   
                   cmp bl,'3'
                   jne lab12
                   jmp advnc6
                   
                   lab12:
                   lea dx,msg
                   call print
         
                   call read
               
               loop l12
              
               call exit
              
               begin6:
                      call clear 
                      
                      call rand
                      
                      cmp dl,35h
                      je th1
                                        
                      cmp dl,31h
                      je th2
                      
                      cmp dl,38h
                      je th3
                      
                      jmp th4
                        
                      th1:
                       lea dx,msg11
                       call print
                        
                       lea dx,x1
                       call print
                      
                       call back
                      
                      th2:
                       lea dx,msg11
                       call print
                        
                       lea dx,x2
                       call print
                      
                       call back
                      
                      th3:
                       lea dx,msg11
                       call print
                        
                       lea dx,x3
                       call print
                       
                       call back
               
               intermed6:
                      call clear 
                      
                      call rand
                      
                      cmp dl,35h
                      je th3
                                        
                      cmp dl,31h
                      je th4
                      
                      cmp dl,38h
                      je th5
                      
                      jmp th6
                        
                      th5:
                       lea dx,msg11
                       call print
                        
                       lea dx,x5
                       call print
                      
                       call back
                       
                       th4:
                       lea dx,msg11
                       call print
                        
                       lea dx,x4
                       call print
                      
                      call back
                      
                      th6:
                       lea dx,msg11
                       call print
                        
                       lea dx,x6
                       call print
                      
                       call back
               
               advnc6:
                      call clear 
                      
                      call rand
                      
                      cmp dl,35h
                      je th2
                                        
                      cmp dl,33h
                      je th3
                      
                      cmp dl,38h
                      je th4
                      
                      jmp th6
         
        horror:
               lea dx,line    
               call print
               
               lea dx,level    
               call print
               
               call read
                             
               mov cx,2
               l13:    
                   mov bl,al
                   cmp bl, '1'
                   je  begin7
             
                   cmp bl,'2'
                   je intermed7
                   
                   cmp bl,'3'
                   jne lab13
                   jmp advnc7
                   
                   lab13:
                   lea dx,msg
                   call print
             
                   call read
               
               loop l13
              
               call exit
              
               begin7:
                      call clear 
                      
                      call rand
                      
                      cmp dl,31h
                      je ho1
                                        
                      cmp dl,34h
                      je ho2
                      
                      cmp dl,39h
                      je ho3
                      
                      jmp ho4
                        
                      ho1:
                       lea dx,msg11
                       call print
                        
                       lea dx,w1
                       call print
                      
                      call back
                      
                      ho2:
                       lea dx,msg11
                       call print
                        
                       lea dx,w2
                       call print
                      
                       call back
                      
                      ho3:
                       lea dx,msg11
                       call print
                        
                       lea dx,w3
                       call print
                       
                       call back
               
               intermed7:
                      call clear 
                      
                      call rand
                      
                      cmp dl,35h
                      je ho1
                                        
                      cmp dl,31h
                      je ho4
                      
                      cmp dl,38h
                      je ho5
                      
                      jmp ho6
                        
                      ho4:
                       lea dx,msg11
                       call print
                        
                       lea dx,w4
                       call print
                      
                       call back
                      
                      ho5:
                       lea dx,msg11
                       call print
                        
                       lea dx,w5
                       call print
                      
                       call back
                      
                      ho6:
                       lea dx,msg11
                       call print
                        
                       lea dx,w6
                       call print
                       
                       call back
               
               advnc7:
                      call clear 
                      
                      call rand
                      
                      cmp dl,32h
                      je ho2
                                        
                      cmp dl,36h
                      je ho5
                      
                      cmp dl,38h
                      je ho6
                      
                      jmp ho3
              
 sad:
     call clear
     
     lea dx,msg4
     call print 
     
     lea dx,msg6
     call print  
     
     call read
    
     mov cx,2
     l14:
         mov bl,al
         cmp bl, 'a'
         je  spi
         
         cmp bl,'b'
         jne lab14
         jmp comedy
         
         lab14:
         lea dx,msg
         call print
         
         call read
    
     loop l14
    
     call exit
     
     spi: 
               lea dx,line    
               call print
               
               lea dx,level    
               call print
               
               call read
              
               mov cx,2
               l15:
              
                   mov bl,al
                   cmp bl, '1'
                   je  begin8
             
                   cmp bl,'2'
                   je intermed8
                   
                   cmp bl,'3'
                   jne lab15
                   jmp advnc8
                   
                   lab15:
                   lea dx,msg
                   call print
             
                   call read
              
               loop l15
              
               call exit
              
               begin8:
                  call clear 
              
                  call rand
                  
                  cmp dl,31h
                  je mn1
                  
                  cmp dl,37h
                  je n1 
                  
                  cmp dl,35h
                  je ooo1
                  
                  jmp o1
                         
                  mn1:
                    lea dx,msg11
                    call print
                    
                    lea dx,M
                    call print
                  
                     call back 
                  
                  n1:
                    lea dx,msg11
                    call print
                    
                    lea dx,N
                    call print
                  
                     call back
                  
                  o1:
                    lea dx,msg11
                    call print
                    
                    lea dx,O
                    call print
                  
                    call back
                  
               intermed8:
                  call clear 
              
                  call rand
                  
                  cmp dl,31h
                  je p1 
                  
                  cmp dl,33h
                  je n1
              
                  cmp dl,39h
                  je u1
                                          
                  jmp ooo1
               
                  p1:
                    lea dx,msg11
                    call print
                    
                    lea dx,P
                    call print
                  
                     call back 
                  
                  u1:
                    lea dx,msg11
                    call print
                    
                    lea dx,Q
                    call print
                  
                     call exit
                  
                  ooo1:
                    lea dx,msg11
                    call print
                    
                    lea dx,O
                    call print
                  
                    call back
                   
               advnc8:
              
                  call clear 
              
                  call rand
                  
                  cmp dl,31h
                  je r1
                  
                  cmp dl,37h
                  je s1 
                  
                  cmp dl,39h
                  je u1
                  
                  jmp p1
                  
                  r1:
                    lea dx,msg11
                    call print
                    
                    lea dx,R
                    call print
                  
                    call back 
                  
                  s1:
                    lea dx,msg11
                    call print
                    
                    lea dx,S
                    call print
                  
                    call back
                     
     comedy:  
               lea dx,line    
               call print
               
               lea dx,level    
               call print
               
               call read
              
               mov cx,2
               l16:
              
                   mov bl,al
                   cmp bl, '1'
                   je  begin9
             
                   cmp bl,'2'
                   je intermed9
                   
                   cmp bl,'3'
                   jne lab16
                   jmp advnc9
                   
                   lab16:
                   lea dx,msg
                   call print
             
                   call read
               
               loop l16
               
               call exit
              
               begin9:
                      call clear 
                      
                      call rand
                      
                      cmp dl,34h
                      je co1
                                        
                      cmp dl,38h
                      je co2
                      
                      cmp dl,39h
                      je co3
                      
                      jmp co4
                        
                      co1:
                       lea dx,msg11
                       call print
                        
                       lea dx,z1
                       call print
                      
                       call back
                      
                      co2:
                       lea dx,msg11
                       call print
                        
                       lea dx,z2
                       call print
                      
                       call back
                      
                      co3:
                       lea dx,msg11
                       call print
                        
                       lea dx,z3
                       call print
                       
                       call back
               
               intermed9:
                      call clear 
                      
                      call rand
                      
                      cmp dl,35h
                      je co3
                                        
                      cmp dl,31h
                      je co4
                      
                      cmp dl,38h
                      je co5
                      
                      jmp co6
                        
                      co4:
                       lea dx,msg11
                       call print
                        
                       lea dx,z4
                       call print
                      
                       call back
                      
                      co5:
                       lea dx,msg11
                       call print
                        
                       lea dx,z5
                       call print
                      
                       call back
                      
                      co6:
                       lea dx,msg11
                       call print
                        
                       lea dx,z6
                       call print
                       
                       call back
               
               advnc9:
                      call clear 
                      
                      call rand
                      
                      cmp dl,30h
                      je co5
                                        
                      cmp dl,36h
                      je co4
                      
                      cmp dl,33h
                      je co6
                      
                      jmp co3
 bored:
         
         call clear 
         
         lea dx,msg4
         call print 
         
         lea dx,msg5
         call print
         
         call read
         
         mov cx,2
         l17: 
             mov bl,al
             cmp bl, 'a'
             je  action
             
             cmp bl,'b'
             jne lab17
             jmp mystery
             
             lab17:
             lea dx,msg
             call print
             
             call read
        
         loop l17
        
         call exit
        
         action:
               lea dx,line    
               call print
               
               lea dx,level    
               call print
               
               call read
              
               mov cx,2
               l18: 
                   mov bl,al
                   cmp bl, '1'
                   je  begin10
             
                   cmp bl,'2'
                   je intermed10
                   
                   cmp bl,'3'
                   jne lab18
                   jmp advnc10
                   
                   lab18:
                   lea dx,msg
                   call print
             
                   call read
              
               loop l18
              
               call exit
               begin10:
                      call clear 
                      
                      call rand
                      
                      cmp dl,35h
                      je ac1
                                        
                      cmp dl,31h
                      je ac2
                      
                      cmp dl,38h
                      je ac3
                      
                      jmp ac4
                        
                      ac1:
                       lea dx,msg11
                       call print
                        
                       lea dx,v1
                       call print
                      
                       call back
                      
                      ac2:
                       lea dx,msg11
                       call print
                        
                       lea dx,v2
                       call print
                      
                       call back
                      
                      ac3:
                       lea dx,msg11
                       call print
                        
                       lea dx,v3
                       call print
                       
                       call back
               intermed10:
                      call clear 
                      
                      call rand
                      
                      cmp dl,35h
                      je ac3
                                        
                      cmp dl,31h
                      je ac4
                      
                      cmp dl,38h
                      je ac5
                      
                      jmp ac6
                      
                      ac4:
                       lea dx,msg11
                       call print
                        
                       lea dx,v4
                       call print
                      
                       call back
                        
                      ac5:
                       lea dx,msg11
                       call print
                        
                       lea dx,v5
                       call print
                      
                       call back
                      
                      ac6:
                       lea dx,msg11
                       call print
                        
                       lea dx,v6
                       call print
                      
                       call back
               advnc10:
                      call clear 
                      
                      call rand
                      
                      cmp dl,35h
                      je ac2
                                        
                      cmp dl,31h
                      je ac4
                      
                      cmp dl,38h
                      je ac5
                      
                      jmp ac1
              
         mystery:
         
               lea dx,line    
               call print
               
               lea dx,level    
               call print
               
               call read
              
               mov cx,2
               l19:      
                   mov bl,al
                   cmp bl, '1'
                   je  begin11
             
                   cmp bl,'2'
                   je intermed11
                   
                   cmp bl,'3'
                   jne lab19
                   jmp advnc11 
                   
                   lab19:
                   lea dx,msg
                   call print
             
                   call read
              
               loop l19
              
               call exit
               begin11:
                      call clear 
                      
                      call rand
                      
                      cmp dl,35h
                      je my1
                                        
                      cmp dl,31h
                      je my2
                      
                      cmp dl,38h
                      je my3
                      
                      jmp my4
                        
                      my1:
                       lea dx,msg11
                       call print
                        
                       lea dx,h1
                       call print
                      
                       call back
                      
                      my2:
                       lea dx,msg11
                       call print
                        
                       lea dx,h2
                       call print
                      
                       call back
                      
                      my3:
                       lea dx,msg11
                       call print
                        
                       lea dx,h3
                       call print
                       
                       call back
               
               intermed11:
                      call clear 
                      
                      call rand
                      
                      cmp dl,35h
                      je my4
                                        
                      cmp dl,31h
                      je my3
                      
                      cmp dl,38h
                      je my6
                      
                      jmp my5
                        
                      my4:
                       lea dx,msg11
                       call print
                        
                       lea dx,h4
                       call print
                      
                       call back
                      
                      my5:
                       lea dx,msg11
                       call print
                        
                       lea dx,h5
                       call print
                      
                       call back
                      
                      my6:
                       lea dx,msg11
                       call print
                        
                       lea dx,h6
                       call print
                       
                       call back
               advnc11:
                      call clear 
                      
                      call rand
                      
                      cmp dl,35h
                      je my6
                              
                      cmp dl,31h
                      je my5
                   
                      cmp dl,38h
                      je my4
                      
                      jmp my1    
    .exit
    main endp
    end main