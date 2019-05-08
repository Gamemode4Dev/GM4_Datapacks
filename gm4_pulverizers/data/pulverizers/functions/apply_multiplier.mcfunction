#@s = pulverizers containing a recipe results
#Run from recipe_validity_check

playsound minecraft:block.grass.break block @a[distance=..6] ~ ~ ~ 1 1.6 1

scoreboard players operation @s gm4_pv_bonus = @s gm4_stack_size
scoreboard players set bonus_stack gm4_stack_size 0

execute store result score stack_multiplier gm4_stack_size run data get block ~ ~ ~ Items[0].tag.gm4_pulverizers.multiplier
scoreboard players operation @s gm4_stack_size *= stack_multiplier gm4_stack_size
execute store result block ~ ~ ~ Items[0].Count byte 1 run scoreboard players get @s gm4_stack_size

#apply bonus
execute if score @s gm4_slot_count matches 1 if score @s gm4_stack_size matches 1.. if block ~ ~ ~ dropper{Items:[{tag:{gm4_pulverizers:{bonus:{}}}}]} run function pulverizers:bonus/apply_bonus

#data remove block
data remove block ~ ~ ~ Items[1].tag.gm4_pulverizers
data remove block ~ ~ ~ Items[0].tag.gm4_pulverizers

#remove tag
execute store result score tag_size gm4_stack_size run data get block ~ ~ ~ Items[1].tag
execute if score tag_size gm4_stack_size matches 0 run data remove block ~ ~ ~ Items[1].tag
execute store result score tag_size gm4_stack_size run data get block ~ ~ ~ Items[0].tag
execute if score tag_size gm4_stack_size matches 0 run data remove block ~ ~ ~ Items[0].tag
