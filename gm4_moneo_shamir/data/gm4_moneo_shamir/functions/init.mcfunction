# This module includes the gm4 forceload library. If you didn't get this pack from our website, make sure you have the gm4 forceload library installed!

execute unless score moneo_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Moneo Shamir"}
scoreboard players set moneo_shamir gm4_modules 1

schedule function gm4_moneo_shamir:main 4t

#$moduleUpdateList
