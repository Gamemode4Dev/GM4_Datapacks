#check clock
scoreboard players add current_tick gm4_df_clock 1
execute if score current_tick gm4_df_clock >= check_tick gm4_df_clock as @e[nbt={InLove:0}] at @s run function dirty_food:run_checks
