# @s = trash_can
# run from main

function gm4_trash_cans:check_dropper

data merge entity @s {Fire:2000}

execute unless block ~ ~ ~ dropper run function gm4_trash_cans:destroy
