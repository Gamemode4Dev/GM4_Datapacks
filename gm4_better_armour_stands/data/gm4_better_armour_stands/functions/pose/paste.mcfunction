# @s = armor_stand to be modified
# at @s
# run from book/apply

# Copy item data to armor_stand.
data modify entity @s {} merge from entity @a[tag=gm4_bas_active,limit=1] Inventory[-1].tag.EntityTag

tag @s add gm4_bas_valid_code

# Play a sound to confirm that the pose was pasted.
playsound minecraft:entity.armor_stand.fall block @a[distance=..5] ~ ~ ~ 0.5 1
