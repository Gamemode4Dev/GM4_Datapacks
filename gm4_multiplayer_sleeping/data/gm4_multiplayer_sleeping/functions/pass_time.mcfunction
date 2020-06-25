#Weather Controls
execute if score value_daytime gm4_sleep_count < value_night gm4_sleep_count run weather thunder 1
execute if score value_daytime gm4_sleep_count > value_morning gm4_sleep_count run weather thunder 1

#Advancements
scoreboard players add @a[tag=gm4_in_bed] gm4_sleep_total 1
advancement grant @a[tag=gm4_in_bed,scores={gm4_sleep_total=50..100}] only gm4:well_rested
advancement grant @a[tag=gm4_in_bed,scores={gm4_sleep_total=3600..}] only gm4:deep_sleeper

#Time Passing
execute if score value_daytime gm4_sleep_count > value_night gm4_sleep_count as @a[tag=gm4_in_bed,limit=5] run time add 200t

#Clock
execute if score value_daytime gm4_sleep_count > value_night gm4_sleep_count if score value_sleepers gm4_sleep_count >= value_required gm4_sleep_count run schedule function gm4_multiplayer_sleeping:pass_time 20t