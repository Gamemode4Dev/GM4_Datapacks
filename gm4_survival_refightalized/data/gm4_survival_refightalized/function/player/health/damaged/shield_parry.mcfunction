
function gm4_survival_refightalized:player/shield/remove_using



playsound minecraft:item.shield.block player @s ~ ~ ~ 1 1.5
stopsound @s player minecraft:entity.player.hurt

execute on attacker run effect give @s weakness 1 9 true
execute on attacker run effect give @s slowness 1 9 true

# dev damage log
tellraw @s[tag=gm4_sr_dev] {"text":"Parry","color":"dark_gray"}
