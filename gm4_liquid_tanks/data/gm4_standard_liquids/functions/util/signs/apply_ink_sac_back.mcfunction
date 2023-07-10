# @s = player clicked a sign with an ink bottle
# at the sign they clicked, alixn xyz
# run from ink_sign

data merge block ~ ~ ~ {back_text:{has_glowing_text:0b}}
execute if entity @s[gamemode=!creative] run item replace entity @s weapon.mainhand with minecraft:glass_bottle
playsound minecraft:item.ink_sac.use block @p[distance=..8]
