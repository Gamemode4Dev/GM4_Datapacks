# @s = player clicked a sign with an ink bottle
# at the sign they clicked
# run from ink_sign

data merge block ~ ~ ~ {GlowingText:1b}
execute if entity @s[gamemode=!creative] run item replace entity @s weapon.mainhand with minecraft:glass_bottle
