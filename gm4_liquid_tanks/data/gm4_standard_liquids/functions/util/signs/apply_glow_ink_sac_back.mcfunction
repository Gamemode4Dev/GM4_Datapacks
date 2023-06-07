# @s = player clicked a sign with an ink bottle
# at the sign they clicked
# run from ink_sign

data merge block ~ ~ ~ {back_text:{has_glowing_text:1b}}
execute if entity @s[gamemode=!creative] run item replace entity @s weapon.mainhand with minecraft:glass_bottle
playsound minecraft:item.glow_ink_sac.use block @p[distance=..8]
