# @s = player holding a soul in a lantern in mainhand
# at @s
# from player/items/check_held_id

# store currently held soul lantern ID into temp player score
execute store result score #current gm4_sf_m_id run data get entity @s SelectedItem.tag.gm4_soul_fragments.id

# check if linked player is nearby
execute as @a[gamemode=!spectator,gamemode=!creative,distance=..8,scores={gm4_sf_fragments=1..}] if score @s gm4_sf_id = #current gm4_sf_m_id run tag @s add gm4_sf_linked

# if so, add to timer if still holding soul in a lantern
execute if entity @a[tag=gm4_sf_linked,distance=..8] if score #current gm4_sf_m_id = @s gm4_sf_m_id run scoreboard players add @s gm4_sf_m_timer 1
execute as @a[tag=gm4_sf_linked,distance=..8] run tag @s remove gm4_sf_linked
execute if score @s gm4_sf_m_timer matches 1..3 run playsound minecraft:block.note_block.cow_bell player @a[distance=..10] ~ ~ ~ .6 .4 .6
execute if score @s gm4_sf_m_timer matches 4 run function gm4_soul_fragments:player/items/spawn_fragment_mainhand
execute unless score #current gm4_sf_m_id = @s gm4_sf_m_id run scoreboard players reset @s gm4_sf_m_timer

# store currently held soul lantern ID into self score for next process
execute store result score @s gm4_sf_m_id run data get entity @s SelectedItem.tag.gm4_soul_fragments.id
