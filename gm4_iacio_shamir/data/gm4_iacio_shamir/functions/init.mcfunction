scoreboard objectives add gm4_ml_iacio_prl minecraft.used:minecraft.ender_pearl
scoreboard objectives add gm4_ml_iacio_snw minecraft.used:minecraft.snowball
scoreboard objectives add gm4_ml_iacio_egg minecraft.used:minecraft.egg
scoreboard objectives add gm4_ml_iacio_sp minecraft.used:minecraft.splash_potion
scoreboard objectives add gm4_ml_iacio_lp minecraft.used:minecraft.lingering_potion

execute unless score iacio_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Iacio shamir"}
scoreboard players set iacio_shamir gm4_modules 1

#$moduleUpdateList
