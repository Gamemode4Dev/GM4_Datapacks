# @s = area effect cloud ray used to detect the fire block
# run from soul_forge/used_flint_and_steel

scoreboard players set $found gm4_count 0
execute store success score $found gm4_count align xyz positioned ~ ~ ~ if block ~ ~ ~ soul_fire unless entity @e[type=armor_stand,tag=gm4_soul_forge,dx=0,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_ray_loc"]}

# move forward
scoreboard players add $ray gm4_count 1
tp @s ^ ^ ^0.01
execute if score $ray gm4_count matches 0..500 at @s unless score $found gm4_count matches 1 run function gm4_orb_of_ankou:soul_forge/ray
