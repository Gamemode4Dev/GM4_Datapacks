# @s = none
# run from cast_rod/marker and go_fish/bobber_animation

scoreboard players add @e[type=armor_stand,tag=gm4_ef_bobber_update] gm4_ef_data 1
kill @e[type=armor_stand,tag=gm4_ef_bobber_update,scores={gm4_ef_data=2..}]
execute if entity @e[type=armor_stand,tag=gm4_ef_bobber_update,limit=1] run schedule function gm4_end_fishing:go_fish/update_bobber 1t
