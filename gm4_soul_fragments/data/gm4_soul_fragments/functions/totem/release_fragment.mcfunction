# @s = soul in a totem on the ground with linked player nearby
# from main

# store id into score
execute store result score @s gm4_sf_id run data get entity @s Item.tag.gm4_soul_fragments.id

# release fragment when near linked player
execute if score @s gm4_sf_id = @a[gamemode=!spectator,gamemode=!creative,scores={gm4_sf_fragments=1..},distance=..16,limit=1] gm4_sf_id run function gm4_soul_fragments:spawn_fragment
