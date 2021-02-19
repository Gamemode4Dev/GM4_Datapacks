# @s = area effect cloud ray used to summon a soul fragment
# run from player/ray/hit_block

# move
tp @s ^ ^-.2 ^-.65

# set scoreboard ID
scoreboard players operation #current gm4_sf_id = @s gm4_sf_id

# summon angry soul if placed away from linked player
execute unless score @p[gamemode=!spectator,distance=..16] gm4_sf_id = #current gm4_sf_id run function gm4_soul_fragments:release_angry_soul

# summon fragment if placed near linked player
execute if score @p[gamemode=!spectator,distance=..16] gm4_sf_id = #current gm4_sf_id run function gm4_soul_fragments:spawn_fragment
