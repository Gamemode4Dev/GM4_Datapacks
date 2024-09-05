scoreboard objectives add gm4_vecto_id dummy

team add gm4_vecto_nocoll
team modify gm4_vecto_nocoll collisionRule never

execute unless score vecto_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Vecto Shamir"}
execute unless score vecto_shamir gm4_earliest_version < vecto_shamir gm4_modules run scoreboard players operation vecto_shamir gm4_earliest_version = vecto_shamir gm4_modules
scoreboard players set vecto_shamir gm4_modules 1

schedule function gm4_vecto_shamir:main 4t

#$moduleUpdateList
