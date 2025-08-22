# displays flames for a 3 candle display
# @s = candle display
# at @s
# run from mechanics/particles/candle_count

particle small_flame ~.05 ~.42 ~-.05
particle small_flame ~-.1 ~.37 ~
particle small_flame ~ ~.27 ~.1
execute if score $rand gm4_llp.data matches 1 run particle smoke ~.05 ~.43 ~-.05
execute if score $rand gm4_llp.data matches 2 run particle smoke ~-.1 ~.38 ~
execute if score $rand gm4_llp.data matches 3 run particle smoke ~ ~.28 ~.1
