################ CSC258H1F Fall 2022 Assembly Final Project ##################
# This file contains our implementation of Breakout.
#
# Student: Andy Shim, 1006950195 
#
#Features:
#Easy:
#1. multiple lives
#2. gameover screen, retry
#4. sound effects
#5. pause
#7. ubreakable bricks
#9. launch ball
#
#hard:
#3. bounce of the paddle different angles
#4. bricks require multiple hits before breaking (if hit straight up)
#7. animation
#
######################## Bitmap Display Configuration ########################
# - Unit width in pixels:       16
# - Unit height in pixels:      16
# - Display width in pixels:    512
# - Display height in pixels:   512
# - Base Address for Display:   0x10008000 ($gp)
##############################################################################

    .data
##############################################################################
# Immutable Data
##############################################################################
# The address of the bitmap display. Don't forget to connect it!
ADDR_DSPL:
    .word 0x10008000
# The address of the keyboard. Don't forget to connect it!
ADDR_KBRD:
    .word 0xffff0000
    
ball_position: .word 0x10008e40

##############################################################################
# Mutable Data
##############################################################################

##############################################################################
# Code
##############################################################################
	.text
	.globl main

	# Run the Brick Breaker game.
lives:
    lw $t0, ADDR_DSPL       # $t0 = base address for display
    beq $t3, 3, two_lives_left
    beq $t3, 2, one_life_left
    beq $t3, 1, game_over_sign
    
    heart: 
    li $t1, 0xff0000 
    sw $t1, 8($t0)
    sw $t1, 12($t0)
    sw $t1,20($t0)
    sw $t1, 24($t0)
    sw $t1, 132($t0)
    sw $t1, 136($t0)
    sw $t1, 140($t0)
    sw $t1, 144($t0)
    sw $t1, 148($t0)
    sw $t1, 152($t0)
    sw $t1, 156($t0)
    sw $t1, 264($t0)
    sw $t1, 268($t0)
    sw $t1, 272($t0)
    sw $t1, 276($t0)
    sw $t1, 280($t0)
    sw $t1, 396($t0)
    sw $t1, 400($t0)
    sw $t1, 404($t0)
    sw $t1, 528($t0)
    
    three_lives:
         li $t1, 0x00ff00  
         
         sw $t1, 36($t0)
         sw $t1, 40($t0)
         sw $t1, 44($t0)
         sw $t1, 172($t0)
         sw $t1, 292($t0)
         sw $t1, 296($t0)
         sw $t1, 300($t0)
         sw $t1, 428($t0)
         sw $t1, 548($t0)
         sw $t1, 552($t0)
         sw $t1, 556($t0)
         j main
         
two_lives_left:
    addi $t1, $zero, 0x00ff00  
    
     
    sw $t1, 420($t0)
    sw $s7, 428($t0)
    
    
    j start_button      

one_life_left:
    addi $t1, $zero, 0x00ff00  
    
    sw $s7, 36($t0)
    sw $s7, 40($t0)
    sw $s7, 292($t0)
    sw $s7, 296($t0)
    sw $s7, 420($t0)
    sw $t1, 428($t0)
    sw $s7, 548($t0)
    sw $s7, 552($t0)
    
    j start_button
    
reset_game:    
         li $t1, 0x00ff00  
         sw $t1, 36($t0)
         sw $s7, 164($t0)
         sw $t1, 40($t0)
         sw $t1, 44($t0)
         sw $t1, 172($t0)
         sw $t1, 292($t0)
         sw $t1, 296($t0)
         sw $t1, 300($t0)
         sw $s7, 420($t0)
         sw $t1, 428($t0)
         sw $t1, 548($t0)
         sw $t1, 552($t0)
         sw $t1, 556($t0)
          
      
          sw $s7, 1808($t0)
          sw $s7, 1812($t0)
          sw $s7, 1816($t0)
          sw $s7, 1820($t0)
          sw $s7, 1936($t0)
          sw $s7, 2064($t0)
          sw $s7, 2192($t0)
          sw $s7, 2320($t0)
          sw $s7, 2324($t0)
          sw $s7, 2328($t0)
          sw $s7, 2332($t0)
          sw $s7, 2204($t0)
          sw $s7, 2076($t0)
          sw $s7, 2072($t0)
      
          sw $s7, 2340($t0)
          sw $s7, 2212($t0)
          sw $s7, 2088($t0)
          sw $s7, 1960($t0)
          sw $s7, 1836($t0)
          sw $s7, 1968($t0)
          sw $s7, 2096($t0)
          sw $s7, 2092($t0)
          sw $s7, 2228($t0)
          sw $s7, 2356($t0)
      
          sw $s7, 2364($t0)
          sw $s7, 2236($t0)
          sw $s7, 2108($t0)
          sw $s7, 1980($t0)
          sw $s7, 1852($t0)
          sw $s7, 1856($t0)
          sw $s7, 1988($t0)
          sw $s7, 2120($t0)
          sw $s7, 2248($t0)
          sw $s7, 1996($t0)
          sw $s7, 1872($t0)
          sw $s7, 1876($t0)
          sw $s7, 2004($t0)
          sw $s7, 2132($t0)
          sw $s7, 2260($t0)
          sw $s7, 2388($t0)
      
          sw $s7, 2396($t0)
          sw $s7, 2400($t0)
          sw $s7, 2404($t0)
          sw $s7, 2408($t0)
          sw $s7, 2268($t0)
          sw $s7, 2140($t0)
          sw $s7, 2144($t0)
          sw $s7, 2148($t0)
          sw $s7, 2012($t0)
          sw $s7, 1884($t0)
          sw $s7, 1888($t0)
          sw $s7, 1892($t0)
          sw $s7, 1896($t0)
      
          sw $s7, 2580($t0)
          sw $s7, 2584($t0)
          sw $s7, 2588($t0)
          sw $s7, 2592($t0)
          sw $s7, 2708($t0)
          sw $s7, 2836($t0)
          sw $s7, 2964($t0)
          sw $s7, 3092($t0)
          sw $s7, 3096($t0)
          sw $s7, 3100($t0)
          sw $s7, 3104($t0)
          sw $s7, 2976($t0)
          sw $s7, 2848($t0)
          sw $s7, 2720($t0)
      
          sw $s7, 2600($t0)
          sw $s7, 2728($t0)
          sw $s7, 2860($t0)
          sw $s7, 2988($t0)
          sw $s7, 3120($t0)
          sw $s7, 2996($t0)
          sw $s7, 2868($t0)
          sw $s7, 2744($t0)
          sw $s7, 2616($t0)
       
          sw $s7, 2624($t0)
          sw $s7, 2628($t0)
          sw $s7, 2632($t0)
          sw $s7, 2636($t0)
          sw $s7, 2752($t0)
          sw $s7, 2880($t0)
          sw $s7, 2884($t0)
          sw $s7, 2888($t0)
          sw $s7, 3008($t0)
          sw $s7, 3136($t0)
          sw $s7, 3140($t0)
          sw $s7, 3144($t0)
          sw $s7, 3148($t0)
      
          sw $s7, 2644($t0)
          sw $s7, 2648($t0)
          sw $s7, 2652($t0)
          sw $s7, 2772($t0)
          sw $s7, 2784($t0)
          sw $s7, 2900($t0)
          sw $s7, 2904($t0)
          sw $s7, 2908($t0)
          sw $s7, 3028($t0)
          sw $s7, 3040($t0)
          sw $s7, 3156($t0)
          sw $s7, 3168($t0)
    
    	
main:
    li $t1, 0xff0000        # $t1 = red
    li $t2, 0x00ff00        # $t2 = green
    li $t3, 0x0000ff        # $t3 = blue
    li $t4, 0x808080 	     # $t4 = gray
    li $t7,  0xffff00        # $t7 = yellow
    li $t8,  0x00ffff        # $t8 = cyan 
    li $t9,  0x8b00ff        # $t9 = purple
    #lw $t0, ADDR_DSPL       # $t0 = base address for display
    addi $s5, $zero, 0x10008f4c  # default paddle position
    addi $s6, $zero, 0x10008ec0 # default ball position
    li $s7, 0x000000       #black
    li $s3, 0xffffff #white
    
    

start_game:
    jal init_top_wall
    jal init_left_wall
    jal init_right_wall
    jal init_blocks
    jal unbreakables  
    jal init_paddle
    jal default_ball
    jal reset_paddle_position
    addi $t3, $zero, 4

start_button:
        li 		$v0, 32
	li 		$a0, 1
	syscall
	
    	lw $s0, ADDR_KBRD               # $t0 = base address for keyboard
    	lw $s1, 0($s0)                  # Load first word from keyboard
    	beq $s1, 1, start_pressed
    	b start_button
    	
    	start_pressed:
    	    lw $a0, 4($s0)                  # Load second word from keyboard
            beq $a0, 32, game_loop  # Check if the key q was pressed
            beq $a0, 113, QuitGame
            b start_button
    
game_loop:
	# 1a. Check if key has been pressed
	li 		$v0, 32
	li 		$a0, 1
	syscall
	
    	lw $s0, ADDR_KBRD               # $t0 = base address for keyboard
    	lw $s1, 0($s0)                  # Load first word from keyboard
    	beq $s1, 1, check_keypressed     # If first word 1, key is pressed
    	j reset_key
        
    # 1b. Check which key has been pressed
    check_keypressed:
    lw $a0, 4($s0)                  # Load second word from keyboard
    beq $a0, 113, QuitGame   # Check if the key q was pressed
    beq $a0, 97, move_left    # a (97)
    beq $a0, 100, move_right     # d (100)
    beq $a0, 112, pause_game # pause
   

    
    # 2a. Check for collisions
	# 2b. Update locations (paddle, ball)
	
        reset_key:
	
	    
	# 3. Draw the screen
	check_ball:
	
	addi $t9, $zero, 0x10008f00
	sltu $t9, $s6, $t9
	beq $t9, 0, lose_life
	
	win:
	    #j init_check_win
	    winregister:
	    
	
	beq $t7, 7, counter_7
	beq $a1, 6, counter_6
	beq $t8, 1, counter_1
	beq $t8, 2, counter_2
	beq $t8, 3, counter_3
	beq $a3, 4, counter_4
	beq $a2, 5, counter_5
	
	    
        
	
	    jal check_above_ball	  
	    jal check_rightup_ball
	    jal check_leftup_ball
	    jal check_unbreakable_below
	    jal check_below_ball	    
	    jal check_leftcorner_ball	    
	    jal check_rightcorner_ball
	
	       
	j sleep
	    
	counter_1:
	    jal bounce_left
	    j sleep
	    
	counter_2:
	    jal bounce_right
	    j sleep
	counter_3:
	    jal bounce_up
	    j sleep
	counter_4:
	    jal bounce_rightup
	    j sleep
	counter_5:
	    jal bounce_leftup
	    j sleep
	counter_6:
	    jal bounce_down
	    j sleep
	    
	 counter_7:
	    jal bounce_downcorner
	    j sleep
	   
	
	    
	# 4. Sleep
	sleep:
	    li $v0, 32
	    li $a0, 60
            syscall

    #5. Go back to 1
    b game_loop
    
    lose_life:
         addi $t3, $t3, -1
         addi $s5, $zero, 0x10008f4c  # default paddle position
    	 addi $s6, $zero, 0x10008ec0 # default ball position
         jal default_ball
    	 jal reset_paddle_position
    	 jal ball_dead
    	 
    
    game_over_sign:
    zero_life:
        sw $t1, 36($t0)
        sw $t1, 40($t0)
        sw $t1, 164($t0)
        sw $t1, 292($t0)
        sw $t1, 420($t0)
        sw $t1, 548($t0)
        sw $t1, 552($t0)
     
    
         li $t1, 0xffff00 
      G:
          sw $t1, 1808($t0)
          sw $t1, 1812($t0)
          sw $t1, 1816($t0)
          sw $t1, 1820($t0)
          sw $t1, 1936($t0)
          sw $t1, 2064($t0)
          sw $t1, 2192($t0)
          sw $t1, 2320($t0)
          sw $t1, 2324($t0)
          sw $t1, 2328($t0)
          sw $t1, 2332($t0)
          sw $t1, 2204($t0)
          sw $t1, 2076($t0)
          sw $t1, 2072($t0)
      A:
          sw $t1, 2340($t0)
          sw $t1, 2212($t0)
          sw $t1, 2088($t0)
          sw $t1, 1960($t0)
          sw $t1, 1836($t0)
          sw $t1, 1968($t0)
          sw $t1, 2096($t0)
          sw $t1, 2092($t0)
          sw $t1, 2228($t0)
          sw $t1, 2356($t0)
      M:
          sw $t1, 2364($t0)
          sw $t1, 2236($t0)
          sw $t1, 2108($t0)
          sw $t1, 1980($t0)
          sw $t1, 1852($t0)
          sw $t1, 1856($t0)
          sw $t1, 1988($t0)
          sw $t1, 2120($t0)
          sw $t1, 2248($t0)
          sw $t1, 1996($t0)
          sw $t1, 1872($t0)
          sw $t1, 1876($t0)
          sw $t1, 2004($t0)
          sw $t1, 2132($t0)
          sw $t1, 2260($t0)
          sw $t1, 2388($t0)
      E:
          sw $t1, 2396($t0)
          sw $t1, 2400($t0)
          sw $t1, 2404($t0)
          sw $t1, 2408($t0)
          sw $t1, 2268($t0)
          sw $t1, 2140($t0)
          sw $t1, 2144($t0)
          sw $t1, 2148($t0)
          sw $t1, 2012($t0)
          sw $t1, 1884($t0)
          sw $t1, 1888($t0)
          sw $t1, 1892($t0)
          sw $t1, 1896($t0)
      O:
          sw $t1, 2580($t0)
          sw $t1, 2584($t0)
          sw $t1, 2588($t0)
          sw $t1, 2592($t0)
          sw $t1, 2708($t0)
          sw $t1, 2836($t0)
          sw $t1, 2964($t0)
          sw $t1, 3092($t0)
          sw $t1, 3096($t0)
          sw $t1, 3100($t0)
          sw $t1, 3104($t0)
          sw $t1, 2976($t0)
          sw $t1, 2848($t0)
          sw $t1, 2720($t0)
      V:
          sw $t1, 2600($t0)
          sw $t1, 2728($t0)
          sw $t1, 2860($t0)
          sw $t1, 2988($t0)
          sw $t1, 3120($t0)
          sw $t1, 2996($t0)
          sw $t1, 2868($t0)
          sw $t1, 2744($t0)
          sw $t1, 2616($t0)
       second_E:
          sw $t1, 2624($t0)
          sw $t1, 2628($t0)
          sw $t1, 2632($t0)
          sw $t1, 2636($t0)
          sw $t1, 2752($t0)
          sw $t1, 2880($t0)
          sw $t1, 2884($t0)
          sw $t1, 2888($t0)
          sw $t1, 3008($t0)
          sw $t1, 3136($t0)
          sw $t1, 3140($t0)
          sw $t1, 3144($t0)
          sw $t1, 3148($t0)
      R:
          sw $t1, 2644($t0)
          sw $t1, 2648($t0)
          sw $t1, 2652($t0)
          sw $t1, 2772($t0)
          sw $t1, 2784($t0)
          sw $t1, 2900($t0)
          sw $t1, 2904($t0)
          sw $t1, 2908($t0)
          sw $t1, 3028($t0)
          sw $t1, 3040($t0)
          sw $t1, 3156($t0)
          sw $t1, 3168($t0)
          
          jal game_over_sound
    game_over:
        
        
           
         
        li 		$v0, 32
	li 		$a0, 1
	syscall
	
    	lw $s0, ADDR_KBRD               # $t0 = base address for keyboard
    	lw $s1, 0($s0)                  # Load first word from keyboard
    	beq $s1, 1, retry_pressed
    	
        b game_over
        retry_pressed:
            jal ball_game_over
            continue:
    	    lw $a0, 4($s0)                  # Load second word from keyboard
            beq $a0, 114, reset_game# restart
            beq $a0, 113, QuitGame   # Check if the key q was pressed
       b game_over

#initialize values for top_wall    
init_top_wall:
add $t5, $zero, $zero    # set $t5 to zero
addi $t6, $zero, 32          # set $t6 to 32
addi $t0, $t0, 768        #set potition to 768th pixel 
top_wall:
    beq $t5, $t6, done_drawing     # Branch to init_left_wall if $t5 == $t6
    
    sw $t4, 0($t0)             # paint first pixel of the fifth row gray
    addi $t0, $t0, 4             # move to next pixel 
    
    addi $t5, $t5, 1             #increment $t5 by 1 
    j top_wall
    
init_left_wall:
    add $t5, $zero, $zero    # set $t5 to zero
    addi $t6, $zero, 25         # set $t6 to 25
left_wall:
    beq $t5, $t6, done_drawing      #  branch to init right wall if t5 t6 are eqaual
    
    sw $t4, 0($t0)             # paint first pixel of the fifth row gray
    addi $t0, $t0, 128             # move to next pixel 
    
    
    addi $t5, $t5, 1             #increment $t5 by 1 
    
    j left_wall
    
    
init_right_wall:
    add $t5, $zero, $zero    # set $t5 to zero
    addi $t6, $zero, 26          # set $t6 to 45
    addi $t0, $t0, 124
right_wall:
    beq $t5, $t6, done_drawing      # branch to init block if t5t6 are equal
    
    sw $t4, 0($t0)             # paint first pixel of the fifth row gray
    addi $t0, $t0, -128             # move to next pixel 
    
    addi $t5, $t5, 1             #increment $t5 by 1 
    
    j right_wall


init_blocks:
    add $t5, $zero, $zero    # set $t5 to zero
    addi $t6, $zero, 30         # set $t6 to 30
    addi $t0, $t0, 8		# set startpoint
blocks:
    beq $t5, $t6, done_drawing    #branch to init paddle if t5 t6 are equal
    
    sw $t3, 0($t0)            # red
    addi $t0, $t0, 128        # next row
    addi $t4, $zero, 0xffa500 # set t4 orange
    sw $t4, 0($t0)            # orange
    addi $t0, $t0, 128        # next row
    sw $t9, 0($t0)            # yellow
    addi $t0, $t0, 128        # next row
    sw $t1, 0($t0)            # green 
    addi $t0, $t0, 128        # next row
    sw $t2, 0($t0)            # cyan
    addi $t0, $t0, 128        # next row
    sw $t8, 0($t0)            # blue
    addi $t0, $t0, 128        # next row 
    #sw $t7, 0($t0)            # purple
    
    addi $t0, $t0, -764       # next column
    
    addi $t5, $t5, 1             #increment $t5 by 1 
    
    j blocks
unbreakables: 
    addi $t4, $zero, 0x808080
    sw $t4, 420($t0)
    sw $t4, 424($t0)
    sw $t4, 360($t0)
    sw $t4, 200($t0)
    sw $t4, 600($t0)
    sw $t4, 1188($t0)
    sw $t4, 1192($t0)
    sw $t4, 1184($t0)
    sw $t4, 1244($t0)
    sw $t4, 1248($t0)
    sw $t4, 1240($t0)
    jr $ra

reset_paddle_position:
    addi $t0, $zero, 0x10008f04
    sw $s7, 4($t0)
    sw $s7, 8($t0)
    sw $s7, 12($t0)
    sw $s7, 16($t0)
    sw $s7, 20($t0)
    sw $s7, 24($t0)
    sw $s7, 28($t0)
    sw $s7, 32($t0)
    sw $s7, 36($t0)
    sw $s7, 40($t0)
    sw $s7, 44($t0)
    sw $s7, 48($t0)
    sw $t4, 52($t0)
    sw $t4, 56($t0)
    sw $t4, 60($t0)
    sw $t4, 64($t0)
    sw $t4, 68($t0)
    sw $s7, 72($t0)
    sw $s7, 76($t0)
    sw $s7, 80($t0)
    sw $s7, 84($t0)
    sw $s7, 88($t0)
    sw $s7, 92($t0)
    sw $s7, 96($t0)
    sw $s7, 100($t0)
    sw $s7, 104($t0)
    sw $s7, 108($t0)
    sw $s7, 112($t0)
    sw $s7, 116($t0)
    add $t0, $zero, $zero
    
    
    jr $ra
    
    
init_paddle:
    add $t5, $zero, $zero    # set $t5 to zero
    addi $t6, $zero, 5		#set t6
    addi $t0, $t0, 2876       #set location
    addi $t4, $zero, 0xff0090  #magenta
     
paddle:
    beq $t5, $t6, done_drawing 		#branch to ball if t5 t6 equal
    
    sw $t4, 0($t0)		
    addi $t0, $t0, 4
    
    addi $t5, $t5, 1  
    
    j paddle
    
update_paddle_left:
    add $t5, $zero, $zero    # set $t5 to zero
    addi $t6, $zero, 5		#set t6
    add $t0, $zero, $s5
    addi $t0, $t0, 20
    sw $s7, 0($t0)
    addi $t0, $t0, -20
    j update_paddle    
    

update_paddle_right:
    add $t5, $zero, $zero    # set $t5 to zero
    addi $t6, $zero, 5		#set t6
    add $t0, $zero, $s5
    addi $t0, $t0, -4
    sw $s7, 0($t0)
    addi $t0, $t0, 4
    j update_paddle

update_paddle:
    beq $t5, $t6, reset_key		#
    
    sw $t4, 0($t0)		
    addi $s5, $s5, 4
    add $t0, $zero, $s5
    
    addi $t5, $t5, 1  
    
    j update_paddle
    
    
check_unbreakable_below:
    addi $s6, $s6, 128
    add $t0, $zero, $s6
    lw $s4, 0($t0)
    bne $s4, 0x808080, position_reset
    addi $t8, $zero, 1 # counter
    j init_bounce_unbreakable


check_below_ball:
    addi $s6, $s6, 128
    add $t0, $zero, $s6
    lw $s4, 0($t0)
    bne $s4, $t4, position_reset
    
    j ball_hit_paddle

position_reset:
    addi $s6, $s6, -128
    add $t0, $zero, $s6
    jr $ra

ball_hit_paddle:

    addi $s6, $s6, -8
    add $t0, $zero, $s6
    lw $s4, 0($t0)
    addi $t8, $zero, 1 # counter
    bne $s4, $t4, init_bounce_left
    
    
    addi $s6, $s6, 16
    add $t0, $zero, $s6
    lw $s4, 0($t0)
    addi $t8, $zero, 2 # counter
    bne $s4, $t4, init_bounce_right
    
    addi $s6, $s6, -8
    add $t0, $zero, $s6
    addi $t8, $zero, 3 # counter
    
    j init_bounce_up

not_breakable_rightup:
    addi $s6, $s6, -4
    add $t0, $zero, $s6
    addi $t2, $zero, 1
    jr $ra

not_breakable_leftup:
    addi $s6, $s6, 4
    add $t0, $zero, $s6
    addi $t2, $zero, 2
    jr $ra
    
check_rightup_ball:
    
    addi $s6, $s6, 4
    add $t0, $zero, $s6
    lw $s4, 0($t0)
    
    
    beq $s4, $s7, not_breakable_rightup
    addi $a3, $zero, 4 # counter
    bne $s4, 0x808080, init_rightup_break
   
    j init_bounce_rightup
    
init_rightup_break:
    add $t0, $zero, $s6   
    sw $s7, 0($t0)
    addi $s6, $s6, -4
    add $t0, $zero, $s6
    addi $t2, $zero, 1
    j counter_4
init_bounce_rightup:
    addi $s6, $s6, -4
    add $t0, $zero, $s6
    addi $t2, $zero, 1
    j counter_4
bounce_rightup:
    addi $t2, $zero, 1
    add $t0, $zero, $s6
    li $t9, 0xffff00
    sw $t9, 0($t0)
            li $v0, 32
	    li $a0, 60
            syscall
    sw $s7, 0($t0)
    addi $s6, $s6, -132
    add $t0, $zero, $s6
    sw $s3, 0($t0)
    lw $s4, -132($t0)
    
	    li $v0, 32
	    li $a0, 60
            syscall
    bne $s4, $s7, ball_blocked_rightup
    jr $ra
    
    
check_leftup_ball:

    
    addi $s6, $s6, -4
    add $t0, $zero, $s6
    lw $s4, 0($t0)
    
     
    beq $s4, $s7, not_breakable_leftup
    addi $a2, $zero, 5 # counter
    bne $s4, 0x808080, init_leftup_break
    
    j init_bounce_leftup

init_leftup_break:
    add $t0, $zero, $s6   
    sw $s7, 0($t0)
    addi $s6, $s6, 4
    add $t0, $zero, $s6
    addi $t2, $zero, 2
    j counter_5 
    
    
init_bounce_leftup:
    addi $s6, $s6, 4
    add $t0, $zero, $s6
    addi $t2, $zero, 2
    j counter_5 
bounce_leftup:
    addi $t2, $zero, 2
    add $t0, $zero, $s6
    li $t9, 0xffff00
    sw $t9, 0($t0)
            li $v0, 32
	    li $a0, 60
            syscall
    sw $s7, 0($t0)
    addi $s6, $s6, -124
    add $t0, $zero, $s6
    sw $s3, 0($t0)
    lw $s4, -124($t0)
    
	    li $v0, 32
	    li $a0, 60
            syscall
    bne $s4, $s7, ball_blocked_leftup
    jr $ra

    

init_bounce_up:
    li $t9, 0xffff00
    sw $t9, 0($t0)
            li $v0, 32
	    li $a0, 60
            syscall
    sw $t4, 0($t0)
    addi $s6, $s6, -128
    add $t0, $zero, $s6
    
    j counter_3


bounce_up:
    add $t0, $zero, $s6
    sw $s7, 0($t0)
    addi $s6, $s6, -128
    add $t0, $zero, $s6
    sw $s3, 0($t0)
    lw $s4, -128($t0)
    
	    li $v0, 32
	    li $a0, 60
            syscall
    
    bne $s4, $s7, ball_blocked_up

    jr $ra

init_bounce_unbreakable:
    addi $s6, $s6, -128
    add $t0, $zero, $s6
    addi $t2, $zero, 1
    j counter_1

init_bounce_left:
    
    li $t9, 0xffff00
    sw $t9, 8($t0)
            li $v0, 32
	    li $a0, 60
            syscall
    sw $t4, 8($t0)
    
    addi $s6, $s6, -120
    add $t0, $zero, $s6
    addi $t2, $zero, 1
    j counter_1
    
    
bounce_left:
     addi $t2, $zero, 1
     add $t0, $zero, $s6
     sw $s7, 0($t0)
     addi $s6, $s6, -132
     add $t0, $zero, $s6 
     sw $s3, 0($t0)
     lw $s4, -132($t0)
     	    li $v0, 32
	    li $a0, 60
            syscall
    bne $s4, $s7, ball_blocked_left
    jr $ra
     
       
init_bounce_right:
    li $t9, 0xffff00
    sw $t9, -8($t0)
            li $v0, 32
	    li $a0, 60
            syscall
    sw $t4, -8($t0)
    addi $s6, $s6, -136
    add $t0, $zero, $s6
    addi $t2, $zero, 2
    j counter_2
    
bounce_right:
     addi $t2, $zero, 2
     add $t0, $zero, $s6
     sw $s7, 0($t0)
     addi $s6, $s6, -124
     add $t0, $zero, $s6
     sw $s3, 0($t0)
     lw $s4, -124($t0)
     	    li $v0, 32
	    li $a0, 60
            syscall
    bne $s4, $s7, ball_blocked_right
    jr $ra
    
    
check_above_ball:
    addi $s6, $s6, -128
    add $t0, $zero, $s6
    lw $s4, 0($t0)
    beq $s4, 0xffff00, init_bounce_down # yellow
    beq $s4, 0x808080, init_bounce_downwall # gray
    beq $s4, 0x00ffff, init_bounce_downyellow#right # cyan
    beq $s4, 0xff0000, init_bounce_downyellow##right # red
    beq $s4, 0xffa500, init_bounce_downyellow##right #orange
    beq $s4, 0x00ff00, init_bounce_downyellow##left# green
    beq $s4, 0x8b00ff, init_bounce_downyellow##left #purple
    beq $s4, 0x0000ff, init_bounce_downyellow##left #blue
    addi $s6, $s6, 128
    add $t0, $zero, $s6
    jr $ra

init_bounce_downwall:
    addi $a1, $zero, 6 # counter
    addi $s6, $s6, 128
    add $t0, $zero, $s6
    
    j counter_6
    
init_bounce_down:
    li $t9, 0xffff00
    sw $t9, 0($t0)
            li $v0, 32
	    li $a0, 80
            syscall
    sw $s7, 0($t0)
    addi $a1, $zero, 6 # counter
    addi $s6, $s6, 128
    add $t0, $zero, $s6
    j counter_6

init_bounce_downyellow:
    li $t9, 0xffff00
    sw $t9, 0($t0)
    addi $a1, $zero, 6 # counter
    addi $s6, $s6, 128
    add $t0, $zero, $s6
    j counter_6
    
bounce_down:
    add $t0, $zero, $s6
    sw $s7, 0($t0)
    addi $s6, $s6, 128
    add $t0, $zero, $s6
    sw $s3, 0($t0)
    lw $s4, 128($t0)
    
	    li $v0, 32
	     li $a0, 60
            syscall
    bne $s4, $s7, ball_blocked_down
    jr $ra
    
    
    
init_bounce_downright:
    sw $s7, 0($t0)
    addi $a1, $zero, 6 # counter
    addi $s6, $s6, 132
    add $t0, $zero, $s6
    j counter_6
bounce_downright:
    sw $s7, 0($t0)
    addi $s6, $s6, 132
    add $t0, $zero, $s6
    sw $s3, 0($t0)
    lw $s4, 132($t0)
    
	    li $v0, 32
	    li $a0, 60
            syscall
    bne $s4, $s7, ball_blocked_down
    jr $ra
    
    
    
init_bounce_downleft:
    sw $s7, 0($t0)
    addi $a1, $zero, 6 # counter
    addi $s6, $s6, 124
    add $t0, $zero, $s6
    j counter_6
bounce_downleft:
    sw $s7, 0($t0)
    addi $s6, $s6, 124
    add $t0, $zero, $s6
    sw $s3, 0($t0)
    lw $s4, 124($t0)
    
	    li $v0, 32
	    li $a0, 60
            syscall
    bne $s4, $s7, ball_blocked_down
    jr $ra
      
check_leftcorner_ball:
    #bne $t2, 1, done_drawing
    addi $s6, $s6, -132
    add $t0, $zero, $s6
    lw $s4, 0($t0)
    bne $s4, $s7, init_bounce_leftdowncorner
    addi $s6, $s6, 132
    add $t0, $zero, $s6
    jr $ra

init_bounce_leftdowncorner:
    beq $s4, 0x808080, skip_breakL
    li $t9, 0xffff00
    beq $s4, $t9, skip_yellowL
    sw $t9, 0($t0)
    skip_yellowL:        
    sw $s7, 0($t0)
    skip_breakL:
    addi $t7, $zero, 7  #counter
    addi $s6, $s6, 132
    add $t0, $zero, $s6
    j counter_7
    
check_rightcorner_ball:
    bne $t2, 2, done_drawing
    addi $s6, $s6, -124
    add $t0, $zero, $s6
    lw $s4, 0($t0)
    bne $s4, $s7, init_bounce_rightdowncorner
    addi $s6, $s6, 124
    add $t0, $zero, $s6
    jr $ra

init_bounce_rightdowncorner:
    beq $s4, 0x808080, skip_breakR
    li $t9, 0xffff00
    beq $s4, $t9, skip_yellowR
    sw $t9, 0($t0)
    skip_yellowR:            
    sw $s7, 0($t0)
    skip_breakR:
    addi $t7, $zero, 7  #counter
    addi $s6, $s6, 124
    add $t0, $zero, $s6
    j counter_7
    
bounce_downcorner:
    add $t0, $zero, $s6
    sw $s7, 0($t0)
    addi $s6, $s6, 128
    add $t0, $zero, $s6
    sw $s3, 0($t0)
    lw $s4, 128($t0)
    
	    li $v0, 32
	    li $a0, 60
            syscall
    bne $s4, $s7, ball_blocked_corner
    jr $ra    

  
  

default_ball:
    addi $t0, $zero, 0x10008ec0         # ball position
    addi $t9, $zero, 0xffffff  # white
    sw $t9, 0($t0)		# draw ball
    
    
done_drawing:
    jr $ra 



move_left:
	    addi $s5, $s5, -24
	    addi $s2, $zero, 0x10008f04
	    sltu $s4, $s5, $s2
	    beq $s4, 0, update_paddle_left
	    addi $s5, $s5, 24
	    j reset_key
	    

move_right:
	    addi $s5, $s5, -16
	    addi $s2, $zero, 0x10008f6c
	    sltu $s4, $s5, $s2
	    beq $s4, 1, update_paddle_right
	    addi $s5, $s5, 16
	    j reset_key
	    

    
ball_blocked_left:
    add $t8, $zero, $zero
    jal bounce_sound
    
    #jr $ra
    j sleep
    
ball_blocked_right:
    add $t8, $zero, $zero
    jal bounce_sound
    
    #jr $ra	
    j sleep
    
ball_blocked_up:
    add $t8, $zero, $zero
    jal bounce_sound
    
    #jr $ra
    j sleep
    
ball_blocked_rightup:
    jal bounce_sound
    add $a3, $zero, $zero # counter
    #jr $ra	
    j sleep
    
ball_blocked_leftup:
    jal bounce_sound
    add $a2, $zero, $zero  # counter
    #jr $ra	
    j sleep
    
ball_blocked_down:
    jal bounce_sound
    add $a1, $zero, $zero# counter
    
    #jr $ra
    j sleep

ball_game_over:
    jal bounce_sound
    add $a1, $zero, $zero# counter
    j continue
    
ball_blocked_corner:
    jal bounce_sound
    add $t7, $zero, $zero# counter
    
    #jr $ra
    j sleep


    
ball_dead:
    jal death_sound
    add $a1, $zero, $zero# counter
    j lives
	            
bounce_sound:
        li $a0, 80	# pitch
	li $a1, 500	# duration
	li $a2, 127	# instrument
	li $a3, 80	# volume
	li $v0, 31
	syscall
	jr $ra
	
death_sound:
        li $a0, 61	# pitch
	li $a1, 750	# duration
	li $a2, 7	# instrument
	li $a3, 64	# volume
	li $v0, 31
	syscall
	jr $ra

game_over_sound:
        li $a0, 61	# pitch
	li $a1, 1500	# duration
	li $a2, 127	# instrument
	li $a3, 80	# volume
	li $v0, 31
	syscall
	jr $ra
	
win_sound:
        li $a0, 100	# pitch
	li $a1, 1500	# duration
	li $a2, 7	# instrument
	li $a3, 80	# volume
	li $v0, 31
	syscall
	jr $ra        
             	                	            
pause_game:
        li 		$v0, 32
	li 		$a0, 1
	syscall
	
    	lw $s0, ADDR_KBRD               # $t0 = base address for keyboard
    	lw $s1, 0($s0)                  # Load first word from keyboard
    	beq $s1, 1, pause_check    # If first word 1, key is pressed
    	b pause_game  
    # 1b. Check which key has been pressed
    pause_check:
    lw $a0, 4($s0)                  # Load second word from keyboard
    beq $a0, 113, QuitGame   # Check if the key q was pressed
    beq $a0, 112, reset_key # resume
    
    b pause_game                                                 

init_check_win:
    addi $t5, $zero, 4096  
    addi $t6, $zero, 768
    add $t0, $zero, $t6  
    check_win:
        beq $t6, 4096, winner
        lw $t1, 0($t0)
        beq $t1, 0xffff00, winregister # yellow
        beq $t1, 0x00ffff, winregister  # cyan
        beq $t1, 0xff0000, winregister ## red
        beq $t1, 0xffa500, winregister #orange
        beq $t1, 0x00ff00, winregister # green
        beq $t1, 0x8b00ff, winregister #purple
        beq $t1, 0x0000ff, winregister  #blue
        addi $t6, $t6, 4
        j check_win
 
winner:
    li $t1, 0xffff00 
    add $t0, $zero, $zero
    
    sw $t1, 1920($t0)
    sw $t1, 2048($t0)
    sw $t1, 2180($t0)
    sw $t1, 2308($t0)
    sw $t1, 2440($t0)
    sw $t1, 2316($t0)
    sw $t1, 2188($t0)
    sw $t1, 2064($t0)
    sw $t1, 1936($t0)
    
    sw $t1, 1944($t0)
    sw $t1, 2072($t0)
    sw $t1, 2200($t0)
    sw $t1, 2328($t0)
    sw $t1, 2456($t0)
    
    sw $t1, 2080($t0)
    sw $t1, 2208($t0)
    sw $t1, 2336($t0)
    sw $t1, 2468($t0)
    sw $t1, 2472($t0)
    sw $t1, 2348($t0)
    sw $t1, 1956($t0)
    sw $t1, 1960($t0)
    sw $t1, 2092($t0)
    
    sw $t1, 1972($t0)
    sw $t1, 1976($t0)
    sw $t1, 1980($t0)
    sw $t1, 1984($t0)
    sw $t1, 1988($t0)
    sw $t1, 2108($t0)
    sw $t1, 2236($t0)
    sw $t1, 2364($t0)
    sw $t1, 2492($t0)
    
    sw $t1, 1996($t0)
    sw $t1, 2000($t0)
    sw $t1, 2132($t0)
    sw $t1, 2260($t0)
    sw $t1, 2388($t0)
    sw $t1, 2120($t0)
    sw $t1, 2248($t0)
    sw $t1, 2376($t0)
    sw $t1, 2508($t0)
    sw $t1, 2512($t0)
    
    sw $t1, 2520($t0)
    sw $t1, 2392($t0)
    sw $t1, 2264($t0)
    sw $t1, 2136($t0)
    sw $t1, 2008($t0)
    sw $t1, 2012($t0)
    sw $t1, 2016($t0)
    sw $t1, 2148($t0)
    sw $t1, 2268($t0)
    sw $t1, 2272($t0)
    sw $t1, 2404($t0)
    sw $t1, 2536($t0)
    
    sw $t1, 2544($t0)
    sw $t1, 2416($t0)
    sw $t1, 2288($t0)
    sw $t1, 2160($t0)
    sw $t1, 2164($t0)
    sw $t1, 2156($t0)
    sw $t1, 2036($t0)
    sw $t1, 1908($t0)
    sw $t1, 2028($t0)
    sw $t1, 1900($t0)
    jal win_sound
    
    
    

next_game:         
        
        li 		$v0, 32
	li 		$a0, 1
	syscall
	
    	lw $s0, ADDR_KBRD               # $t0 = base address for keyboard
    	lw $s1, 0($s0)                  # Load first word from keyboard
    	beq $s1, 1, play_again
    	
        b next_game
        play_again:
            add $t8, $zero, $zero
            add $a3, $zero, $zero # counter
            add $a2, $zero, $zero  # counter
            add $a1, $zero, $zero# counter
            add $t7, $zero, $zero# counter
    	    lw $a0, 4($s0)                  # Load second word from keyboard
            beq $a0, 114, reset_game# restart
            beq $a0, 113, QuitGame   # Check if the key q was pressed
       b next_game
        
    
QuitGame:
    	    li $v0, 10                      # Quit gracefully
    	    syscall


    
	
    
    
    
