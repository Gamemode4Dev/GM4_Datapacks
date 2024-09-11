# @s = boiling zauber cauldron with grass and enchanted_prismarine_shard and poisonous flowers inside.
# at center of block
# run from recipes/flowers/check_normal_flowers

execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]
execute align y positioned ~ ~.75 ~ run effect give @a[distance=..2,gamemode=!spectator] minecraft:luck infinite 0 true
summon area_effect_cloud ~ ~.75 ~ {Tags:["gm4_zc_luck_cloud"],Radius:1.6f,Duration:10,RadiusOnUse:0.0f,RadiusPerTick:0.0f,ReapplicationDelay:100,Particle:{type:"minecraft:happy_villager"},potion_contents:{custom_effects:[{id:"minecraft:luck",amplifier:0,duration:12,show_particles:0b}]}}
playsound entity.player.levelup block @a[distance=..16] ~ ~ ~ 1 1.5
scoreboard players set $recipe_success gm4_zc_data 1
