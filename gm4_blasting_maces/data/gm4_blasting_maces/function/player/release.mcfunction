# Blasts the 3x3 at the block they aim at, if the mace was charged long enough
# @s = player
# at @s
# run from gm4_blasting_maces:tick

# cancel if the charged mace is no longer in that hand
execute if score @s gm4_blast_slot matches -1 unless items entity @s weapon.offhand minecraft:mace[minecraft:enchantments~[{enchantment:"gm4_blasting_maces:blasting"}]] run return run scoreboard players set @s gm4_blast_charge_ticks 0
execute if score @s gm4_blast_slot matches 0.. unless items entity @s weapon.mainhand minecraft:mace[minecraft:enchantments~[{enchantment:"gm4_blasting_maces:blasting"}]] run return run scoreboard players set @s gm4_blast_charge_ticks 0

# stop if it was not charged for long enough
execute unless score @s gm4_blast_charge_ticks matches 20.. run return run scoreboard players set @s gm4_blast_charge_ticks 0
scoreboard players set @s gm4_blast_charge_ticks 0

# cast a ray from the eyes to the block they aim at
scoreboard players set $hit gm4_blast_data 0
scoreboard players set $face_axis gm4_blast_data 0
execute store result score $ray gm4_blast_data run attribute @s minecraft:block_interaction_range get 10
execute anchored eyes positioned ^ ^ ^ run function gm4_blasting_maces:mining/raycast
kill @e[type=marker,tag=gm4_blast_entry]

# blast at the hit block, then clean up the marker
execute if score $hit gm4_blast_data matches 1 at @e[type=marker,tag=gm4_blast_origin,limit=1] run function gm4_blasting_maces:player/blast
kill @e[type=marker,tag=gm4_blast_origin]
