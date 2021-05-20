scoreboard objectives add gm4_ml_vecto_id dummy

execute unless score vecto_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Vecto Shamir"}
scoreboard players set vecto_shamir gm4_modules 1

schedule function gm4_vecto_shamir:main 4t

#$moduleUpdateList
