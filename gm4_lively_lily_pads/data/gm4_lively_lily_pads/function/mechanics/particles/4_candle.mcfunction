# displays flames for a 4 candle display
# @s = candle display
# at @s
# run from mechanics/particles/candle_count

particle small_flame ~.05 ~.42 ~-.1
particle small_flame ~-.1 ~.37 ~-.1
particle small_flame ~.1 ~.37 ~.05
particle small_flame ~-.05 ~.27 ~.05
execute if score $rand gm4_llp.data matches 1 run particle smoke ~.05 ~.43 ~-.1
execute if score $rand gm4_llp.data matches 2 run particle smoke ~-.1 ~.38 ~-.1
execute if score $rand gm4_llp.data matches 3 run particle smoke ~.1 ~.38 ~.05
execute if score $rand gm4_llp.data matches 4 run particle smoke ~-.05 ~.28 ~.05
