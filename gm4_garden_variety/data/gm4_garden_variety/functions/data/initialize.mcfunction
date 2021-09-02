# adds fake player scores for the minimum and maximum height of each tree
# run from gm4_garden_variety:init


##### SCOREBOARDS ##### (add scoreboards)
# generation
scoreboard objectives add gm4_gv_math_num dummy
scoreboard objectives add gm4_gv_gen_data dummy
scoreboard objectives add gm4_gv_tree_type dummy
# mutations
scoreboard objectives add gm4_gv_nbt_data dummy
# arborist
scoreboard objectives add gm4_gv_arborist dummy
scoreboard objectives add gm4_gv_trades dummy
scoreboard objectives add gm4_gv_job_id dummy
scoreboard objectives add gm4_gv_prev_xp dummy
# analyzer
scoreboard objectives add gm4_gv_analyze dummy
scoreboard objectives add gm4_gv_analyze_p dummy
# research book
scoreboard objectives add gm4_gv_research dummy
# mutations
scoreboard objectives add gm4_gv_mutations dummy



##### MISC #####
execute store result score $world_seed gm4_gv_gen_data run seed



##### FRUIT ##### (set fruit variables)
# red berry
scoreboard players set #red_berry_fruit_stage_1_start gm4_gv_math_num 5
scoreboard players set #red_berry_fruit_stage_1_start gm4_gv_math_num 10
scoreboard players set #red_berry_fruit_stage_1_start gm4_gv_math_num 15
# apple
scoreboard players set #apple_fruit_stage_1_start gm4_gv_math_num 5
scoreboard players set #apple_fruit_stage_1_start gm4_gv_math_num 10
scoreboard players set #apple_fruit_stage_1_start gm4_gv_math_num 15



##### RESEARCH BOOK ##### (set research book pages)
data modify storage gm4_garden_variety:research_book/pages research_book set value '[{"text":""},{"text":"    Research Book"},{"text":"\\n-------------------"},{"text":"\\nAs I explore the world I have found a wide variety of trees. This book shall be the place that I store my knowledge."}]'
data modify storage gm4_garden_variety:research_book/pages the_machine set value '[{"text":""},{"text":"     The Machine"},{"text":"\\n-------------------"},{"text":"\\nAs I observe the trees I wonder if perhaps their is more hidden beneath the bark. I must construct a machine to satisfy my thirst for answers. If only I had some copper, a spyglass, and a nice read before bed."}]'
data modify storage gm4_garden_variety:research_book/pages the_analyzer set value '[{"text":""},{"text":"     The Analyzer"},{"text":"\\n-------------------"},{"text":"\\nThe design came to me while I was sleeping! <recipe>"}]'



##### STATIC VARIABLES ##### (set static variables)
scoreboard players set #-90 gm4_gv_math_num -90
scoreboard players set #-85 gm4_gv_math_num -85
scoreboard players set #-80 gm4_gv_math_num -80
scoreboard players set #-75 gm4_gv_math_num -75
scoreboard players set #-70 gm4_gv_math_num -70
scoreboard players set #-75 gm4_gv_math_num -75
scoreboard players set #-60 gm4_gv_math_num -60
scoreboard players set #-55 gm4_gv_math_num -55
scoreboard players set #-50 gm4_gv_math_num -50
scoreboard players set #-45 gm4_gv_math_num -45
scoreboard players set #-40 gm4_gv_math_num -40
scoreboard players set #-30 gm4_gv_math_num -30
scoreboard players set #-20 gm4_gv_math_num -20
scoreboard players set #-10 gm4_gv_math_num -10
scoreboard players set #-1 gm4_gv_math_num -1
scoreboard players set #0 gm4_gv_math_num 0
scoreboard players set #1 gm4_gv_math_num 1
scoreboard players set #2 gm4_gv_math_num 2
scoreboard players set #3 gm4_gv_math_num 3
scoreboard players set #4 gm4_gv_math_num 4
scoreboard players set #5 gm4_gv_math_num 5
scoreboard players set #6 gm4_gv_math_num 6
scoreboard players set #7 gm4_gv_math_num 7
scoreboard players set #8 gm4_gv_math_num 8
scoreboard players set #9 gm4_gv_math_num 9
scoreboard players set #10 gm4_gv_math_num 10
scoreboard players set #15 gm4_gv_math_num 15
scoreboard players set #16 gm4_gv_math_num 16
scoreboard players set #20 gm4_gv_math_num 20
scoreboard players set #32 gm4_gv_math_num 32
scoreboard players set #64 gm4_gv_math_num 64
scoreboard players set #65 gm4_gv_math_num 65
scoreboard players set #70 gm4_gv_math_num 70
scoreboard players set #73 gm4_gv_math_num 73
scoreboard players set #90 gm4_gv_math_num 90
scoreboard players set #97 gm4_gv_math_num 97
scoreboard players set #99 gm4_gv_math_num 99
scoreboard players set #100 gm4_gv_math_num 100
scoreboard players set #180 gm4_gv_math_num 180
scoreboard players set #360 gm4_gv_math_num 360
scoreboard players set #1000 gm4_gv_math_num 1000
scoreboard players set #10000 gm4_gv_math_num 10000
scoreboard players set #100000 gm4_gv_math_num 100000
scoreboard players set #1000000 gm4_gv_math_num 1000000
scoreboard players set #10000000 gm4_gv_math_num 10000000
scoreboard players set #100000000 gm4_gv_math_num 100000000
scoreboard players set #65536 gm4_gv_math_num 65536 
