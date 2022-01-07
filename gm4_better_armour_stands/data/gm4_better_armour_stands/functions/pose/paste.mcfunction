# @s = armor_stand to be modified
# at @s
# run from book/apply

# Copy item data to armor_stand.
data modify entity @s {} merge from entity @a[tag=gm4_bas_active,limit=1] Inventory[-1].tag.EntityTag

scoreboard players set $valid_code gm4_bas_data 1

# Play a sound to confirm that the pose was pasted.
playsound minecraft:entity.armor_stand.fall block @a[distance=..6] ~ ~ ~ 0.5 1
