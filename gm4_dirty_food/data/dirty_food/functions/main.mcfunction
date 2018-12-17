#give/remove tags
tag @e[nbt={InLove:0}] add gm4_can_breed
tag @e[nbt=!{InLove:0}] remove gm4_can_breed
#check clock
scoreboard players add current_tick gm4_df_clock 1
execute if score current_tick gm4_df_clock >= check_tick gm4_df_clock as @e[tag=gm4_can_breed] at @s run function dirty_food:run_checks
