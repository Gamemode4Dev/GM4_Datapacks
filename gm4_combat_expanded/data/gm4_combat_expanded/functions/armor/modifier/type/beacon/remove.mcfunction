# remove a beacon light
# @s = light beacon marker
# at @s
# run from main

fill ~ ~ ~ ~ ~ ~ air replace light[waterlogged=false]
fill ~ ~ ~ ~ ~ ~ water replace light[waterlogged=true]
kill @s
