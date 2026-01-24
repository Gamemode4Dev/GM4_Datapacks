# Starts the blasting mace mining sequence based on the enchantment level
# @s = player with blasting mace who just broke a block
# at @s
# run from gm4_blasting_maces:player/check_for_mace

# find the nearest dropped item (from the block that was just broken)
# place marker at that location for any item drop
# distance 8 to account for max reach + item drop physics
scoreboard players set $success gm4_blast_data 0
execute as @e[type=item,limit=1,distance=..8,sort=nearest,nbt={Age:0s}] at @s store success score $success gm4_blast_data \
  if items entity @s container.* #gm4_blasting_maces:breakable align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_blast_source","gm4_blast_marker","smithed.entity","smithed.strict"]}

# if we found a valid block, save mace NBT and store player pitch for directional mining
execute if score $success gm4_blast_data matches 1 run data modify storage gm4_blasting_maces:temp tool set from entity @s SelectedItem
execute if score $success gm4_blast_data matches 1 store result score @s gm4_blast_pitch run data get entity @s Rotation[1] 1

# perform directional detonation at marker location
execute if score $success gm4_blast_data matches 1 at @e[type=marker,tag=gm4_blast_source,limit=1] run function gm4_blasting_maces:mining/detonate

# apply durability damage based on blocks broken
execute if score $blast_count gm4_blast_data matches 1.. run function gm4_blasting_maces:player/modify_mace_durability

# cleanup marker
kill @e[type=marker,tag=gm4_blast_source]

# clear storage
data remove storage gm4_blasting_maces:temp tool
