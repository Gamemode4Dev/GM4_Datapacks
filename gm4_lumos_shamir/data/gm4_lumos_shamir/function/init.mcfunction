execute unless score lumos_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Lumos Shamir"}
execute unless score lumos_shamir gm4_earliest_version < lumos_shamir gm4_modules run scoreboard players operation lumos_shamir gm4_earliest_version = lumos_shamir gm4_modules
scoreboard players set lumos_shamir gm4_modules 1

schedule function gm4_lumos_shamir:main 4t

#$moduleUpdateList
