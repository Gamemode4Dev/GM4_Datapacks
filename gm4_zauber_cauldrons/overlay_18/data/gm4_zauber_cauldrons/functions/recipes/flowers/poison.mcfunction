# @s = boiling zauber cauldron with grass and enchanted_prismarine_shard and poisonous flowers inside.
# at center of block
# run from recipes/flowers/check_poisonous_flowers

execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]
summon area_effect_cloud ~ ~.75 ~ {CustomName:'"the mess they made"',Radius:2.1f,Duration:2147483647,RadiusOnUse:-0.1f,RadiusPerTick:-0.005f,ReapplicationDelay:40,Effects:[{Duration:3200,Id:19,Amplifier:2b}]}
playsound entity.elder_guardian.curse block @a[distance=..16] ~ ~ ~ 0.6 0.7
scoreboard players set $recipe_success gm4_zc_data 1

# set $expected_item_amount to 0, this turns all items into vexes
scoreboard players set $expected_item_amount gm4_zc_fullness 0
