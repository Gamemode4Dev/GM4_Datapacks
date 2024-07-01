scoreboard objectives add gm4_animi_deaths deathCount
scoreboard objectives add gm4_animi_leave minecraft.custom:minecraft.leave_game

execute unless score animi_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Animi Shamir"}
execute unless score animi_shamir gm4_earliest_version < animi_shamir gm4_modules run scoreboard players operation animi_shamir gm4_earliest_version = animi_shamir gm4_modules
scoreboard players set animi_shamir gm4_modules 1

#$moduleUpdateList
