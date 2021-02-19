# @s = soul in a lantern on the ground
# from soul_lantern/process

# store id into score
execute store result score @s gm4_sf_id run data get entity @s Item.tag.gm4_soul_fragments.id

# release fragment when near linked player
execute if score @s gm4_sf_id = @a[gamemode=!spectator,gamemode=!creative,scores={gm4_sf_fragments=1..},distance=..16,limit=1] gm4_sf_id run tag @s add gm4_sf_near_linked
execute if entity @s[tag=gm4_sf_near_linked] run function gm4_soul_fragments:spawn_fragment

# release fragment if far away from any players
execute if entity @s[tag=!gm4_sf_near_linked] unless entity @a[gamemode=!spectator,distance=..6] run function gm4_soul_fragments:release_angry_soul
