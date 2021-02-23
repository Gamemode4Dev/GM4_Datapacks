# @s = area effect cloud ray used to summon a soul fragment
# run from player/ray/hit_block

# move
tp @s ^ ^-.2 ^-.65

# summon soul fragment, apply score ID and die
function gm4_soul_fragments:player/spawn_fragment
scoreboard players operation @e[type=minecraft:area_effect_cloud,tag=gm4_new_soul_fragment,limit=1,sort=nearest,distance=...3] gm4_sf_id = @s gm4_sf_id
tag @e[type=area_effect_cloud,tag=gm4_new_soul_fragment] remove gm4_new_soul_fragment
execute if entity @s[type=area_effect_cloud] run kill @s