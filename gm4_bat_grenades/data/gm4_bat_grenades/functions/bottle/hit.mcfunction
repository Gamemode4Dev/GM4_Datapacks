# @s = player hitting a bat with a glass_bottle
# at @s
# run from advancement capture

advancement revoke @s only gm4_bat_grenades:capture

# find bat, store data, kill
execute positioned ^ ^2.5 ^ as @e[type=bat,distance=..5,nbt={HurtTime:10s}] run function gm4_bat_grenades:bottle/capture

# replace glass_bottle with bat in a bottle
item modify entity @s weapon.mainhand gm4_bat_grenades:remove_item
loot give @s loot gm4_bat_grenades:bat_in_a_bottle
data remove storage gm4_bat_grenades:temp data
