# Blasts the 3x3 area around the targeted block in the plane of the hit face
# @s = player
# at the targeted block
# run from gm4_blasting_maces:player/release

# reset the block count
scoreboard players set $count gm4_blast_data 0

# break the full 3x3 plane in the plane of the hit face
execute if score $face_axis gm4_blast_data matches 1 rotated 90 0 run function gm4_blasting_maces:mining/plane_3x3
execute if score $face_axis gm4_blast_data matches 2 rotated 0 90 run function gm4_blasting_maces:mining/plane_3x3
execute if score $face_axis gm4_blast_data matches 3 rotated 0 0 run function gm4_blasting_maces:mining/plane_3x3

# blast effects
particle minecraft:explosion ~ ~ ~ 0 0 0 0 0
playsound minecraft:entity.generic.explode block @a ~ ~ ~ 0.6 1.0

# push nearby entities with a wind burst (no damage)
summon minecraft:wind_charge ~ ~ ~ {Motion:[0.0,-5.0,0.0],Tags:["gm4_blast_wind"]}

# lose durability based on how many blocks broke
execute if score $count gm4_blast_data matches 1.. at @s run function gm4_blasting_maces:player/durability/apply

# unlock the module advancement on the first successful blast
execute if score $count gm4_blast_data matches 1.. run advancement grant @s only gm4:blasting_maces
