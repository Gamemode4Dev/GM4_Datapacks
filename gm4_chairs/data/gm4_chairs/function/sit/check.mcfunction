execute as @a[predicate=gm4_chairs:sitting_in_chair] run function gm4_chairs:sit/counter

schedule function gm4_chairs:sit/check 10s
