# @s = armor_stand to be modified
# at @s
# run from book/apply

scoreboard players set $valid_code gm4_bas_data 1

# copy item data to armor_stand
data modify entity @s {} merge from entity @a[tag=gm4_bas_active,limit=1] Inventory[-1].tag.EntityTag

# play a sound to confirm
playsound minecraft:entity.armor_stand.fall block @a[distance=..6] ~ ~ ~ 0.5 1
