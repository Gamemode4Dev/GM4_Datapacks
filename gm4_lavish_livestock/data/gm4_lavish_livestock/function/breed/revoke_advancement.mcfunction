advancement revoke @s only gm4_lavish_livestock:breed_pig

scoreboard players set $parent_selected gm4_lavish_livestock_data -1
execute as @e[type=pig,distance=..10,limit=2,sort=nearest,nbt=!{InLove:0}] run function gm4_lavish_livestock:breed/determine_parent
schedule function gm4_lavish_livestock:find_baby 1t
