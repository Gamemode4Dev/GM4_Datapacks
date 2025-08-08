# displays flames for a 2 candle display
# @s = candle display
# at @s
# run from mechanics/particles/candle_count

particle small_flame ~.1 ~.42 ~-.05
particle small_flame ~-.1 ~.37 ~
execute if score $rand gm4_llp.data matches 1 run particle smoke ~.1 ~.43 ~-.05
execute if score $rand gm4_llp.data matches 2 run particle smoke ~-.1 ~.38 ~
