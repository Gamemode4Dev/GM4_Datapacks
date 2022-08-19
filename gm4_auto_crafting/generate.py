from io import TextIOWrapper
import os, json, getpass, collections, shutil, zipfile
from github import Github, Repository
from urllib import request

GITHUB_REPO = "misode/mcmeta"   # github repo to extract recipes from
VERSION = "1.19"              # version to extract recipes from
SHA = "071befb7fa9569ffa0043f74289d0ef1ec5ffc8b" # <- sha for 1.19 --- change to empty string if generating for a new version

NAME = "gm4_auto_crafting"      # name of the module
DIR = f"{NAME}/data/{NAME}"
FUNCTION_FOLDER = f"{DIR}/functions"
LOOT_PATH = "crafting"

BRANCH_PATH = "check_recipes"    # folder where all the search tree stuff will take place

buckets = [
    "minecraft:axolotl_bucket",
    "minecraft:cod_bucket",
    "minecraft:lava_bucket",
    "minecraft:milk_bucket",
    "minecraft:powder_snow_bucket",
    "minecraft:pufferfish_bucket",
    "minecraft:salmon_bucket",
    "minecraft:tropical_fish_bucket",
    "minecraft:water_bucket"
]

bottles = [
    "minecraft:dragon_breath",
    "minecraft:honey_bottle",
    "minecraft:potion"
]

## DO NOT CHANGE ORDER OF THIS LIST
unstackables = [
    "minecraft:shulker_box",                # stacksTo(1)
    "minecraft:white_shulker_box",
    "minecraft:orange_shulker_box",
    "minecraft:magenta_shulker_box",
    "minecraft:light_blue_shulker_box",
    "minecraft:yellow_shulker_box",
    "minecraft:lime_shulker_box",
    "minecraft:pink_shulker_box",
    "minecraft:gray_shulker_box",
    "minecraft:light_gray_shulker_box",
    "minecraft:cyan_shulker_box",
    "minecraft:purple_shulker_box",
    "minecraft:blue_shulker_box",
    "minecraft:brown_shulker_box",
    "minecraft:green_shulker_box",
    "minecraft:red_shulker_box",
    "minecraft:black_shulker_box",
    "minecraft:saddle",
    "minecraft:minecart",
    "minecraft:chest_minecart",
    "minecraft:furnace_minecart",
    "minecraft:tnt_minecart",
    "minecraft:hopper_minecart",
    "minecraft:oak_boat",
    "minecraft:spruce_boat",
    "minecraft:birch_boat",
    "minecraft:jungle_boat",
    "minecraft:acacia_boat",
    "minecraft:dark_oak_boat",
    "minecraft:mangrove_boat",
    "minecraft:mushroom_stew",
    "minecraft:water_bucket",
    "minecraft:lava_bucket",
    "minecraft:powder_snow_bucket",
    "minecraft:milk_bucket",
    "minecraft:pufferfish_bucket",
    "minecraft:salmon_bucket",
    "minecraft:cod_bucket",
    "minecraft:tropical_fish_bucket",
    "minecraft:axolotl_bucket",
    "minecraft:tadpole_bucket",
    "minecraft:bundle",
    "minecraft:spyglass",
    "minecraft:cake",
    "minecraft:white_bed",
    "minecraft:orange_bed",
    "minecraft:magenta_bed",
    "minecraft:light_blue_bed",
    "minecraft:yellow_bed",
    "minecraft:lime_bed",
    "minecraft:pink_bed",
    "minecraft:gray_bed",
    "minecraft:light_gray_bed",
    "minecraft:cyan_bed",
    "minecraft:purple_bed",
    "minecraft:blue_bed",
    "minecraft:brown_bed",
    "minecraft:green_bed",
    "minecraft:red_bed",
    "minecraft:black_bed",
    "minecraft:potion",
    "minecraft:writable_book",
    "minecraft:enchanted_book",
    "minecraft:rabbit_stew",
    "minecraft:iron_horse_armor",
    "minecraft:golden_horse_armor",
    "minecraft:diamond_horse_armor",
    "minecraft:leather_horse_armor",
    "minecraft:command_block_minecart",
    "minecraft:beetroot_soup",
    "minecraft:splash_potion",
    "minecraft:lingering_potion",
    "minecraft:totem_of_undying",
    "minecraft:knowledge_book",
    "minecraft:debug_stick",
    "minecraft:music_disc_13",
    "minecraft:music_disc_cat",
    "minecraft:music_disc_blocks",
    "minecraft:music_disc_chirp",
    "minecraft:music_disc_far",
    "minecraft:music_disc_mall",
    "minecraft:music_disc_mellohi",
    "minecraft:music_disc_stal",
    "minecraft:music_disc_strad",
    "minecraft:music_disc_ward",
    "minecraft:music_disc_11",
    "minecraft:music_disc_wait",
    "minecraft:music_disc_otherside",
    "minecraft:music_disc_pigstep",
    "minecraft:crossbow",
    "minecraft:suspicious_stew",
    "minecraft:flower_banner_pattern",
    "minecraft:creeper_banner_pattern",
    "minecraft:skull_banner_pattern",
    "minecraft:mojang_banner_pattern",
    "minecraft:globe_banner_pattern",
    "minecraft:piglin_banner_pattern",
    "minecraft:carrot_on_a_stick",
    "minecraft:warped_fungus_on_a_stick",   # durability
    "minecraft:elytra",
    "minecraft:flint_and_steel",
    "minecraft:bow",
    "minecraft:fishing_rod",
    "minecraft:shears",
    "minecraft:shield",
    "minecraft:trident",
    "minecraft:wooden_sword",               # SwordItem
    "minecraft:stone_sword",
    "minecraft:golden_sword",
    "minecraft:iron_sword",
    "minecraft:diamond_sword",
    "minecraft:netherite_sword",
    "minecraft:wooden_axe",                 # AxeItem
    "minecraft:stone_axe",
    "minecraft:golden_axe",
    "minecraft:iron_axe",
    "minecraft:diamond_axe",
    "minecraft:netherite_axe",
    "minecraft:wooden_hoe",                 # HoeItem
    "minecraft:stone_hoe",
    "minecraft:golden_hoe",
    "minecraft:iron_hoe",
    "minecraft:diamond_hoe",
    "minecraft:netherite_hoe",
    "minecraft:wooden_pickaxe",             # PickaxeItem
    "minecraft:stone_pickaxe",
    "minecraft:golden_pickaxe",
    "minecraft:iron_pickaxe",
    "minecraft:diamond_pickaxe",
    "minecraft:netherite_pickaxe",
    "minecraft:wooden_shovel",             # ShovelItem
    "minecraft:stone_shovel",
    "minecraft:golden_shovel",
    "minecraft:iron_shovel",
    "minecraft:diamond_shovel",
    "minecraft:netherite_shovel"
    "minecraft:turtle_helmet",              # ArmorItem
    "minecraft:leather_helmet",
    "minecraft:leather_chestplate",
    "minecraft:leather_leggings",
    "minecraft:leather_boots",
    "minecraft:chainmail_helmet",
    "minecraft:chainmail_chestplate",
    "minecraft:chainmail_leggings",
    "minecraft:chainmail_boots",
    "minecraft:iron_helmet",
    "minecraft:iron_chestplate",
    "minecraft:iron_leggings",
    "minecraft:iron_boots",
    "minecraft:diamond_helmet",
    "minecraft:diamond_chestplate",
    "minecraft:diamond_leggings",
    "minecraft:diamond_boots",
    "minecraft:golden_helmet",
    "minecraft:golden_chestplate",
    "minecraft:golden_leggings",
    "minecraft:golden_boots",
    "minecraft:netherite_helmet",
    "minecraft:netherite_chestplate",
    "minecraft:netherite_leggings",
    "minecraft:netherite_boots"
]

## DO NOT CHANGE ORDER OF THIS LIST
stackable_16 = [
    "minecraft:oak_sign",
    "minecraft:spruce_sign",
    "minecraft:birch_sign",
    "minecraft:jungle_sign",
    "minecraft:acacia_sign",
    "minecraft:dark_oak_sign",
    "minecraft:mangrove_sign",
    "minecraft:crimson_sign",
    "minecraft:warped_sign"
    "minecraft:bucket",
    "minecraft:snowball",
    "minecraft:egg",
    "minecraft:ender_pearl",
    "minecraft:written_book",
    "minecraft:armor_stand",
    "minecraft:white_banner",
    "minecraft:white_banner",
    "minecraft:orange_banner",
    "minecraft:magenta_banner",
    "minecraft:light_blue_banner",
    "minecraft:yellow_banner",
    "minecraft:lime_banner",
    "minecraft:pink_banner",
    "minecraft:gray_banner",
    "minecraft:light_gray_banner",
    "minecraft:cyan_banner",
    "minecraft:purple_banner",
    "minecraft:blue_banner",
    "minecraft:brown_banner",
    "minecraft:green_banner",
    "minecraft:red_banner",
    "minecraft:black_banner",
    "minecraft:honey_bottle"
]



def main() -> None:
    recipes = []
    predicates = []
    # get the json of the recipes
    recipes_json = get_recipes(VERSION, True)
    ## test recipe
    ## recipes_json = [{"name":"not_an_item", "contents": {"type": "minecraft:crafting_shaped","pattern": ["XX","XX","##"],"key": {"#": {"item": "minecraft:stick"},"X": {"tag": "minecraft:stone_tool_materials"}},"result": {"item": "minecraft:random"}}},{"name":"iron_pickaxe", "contents": {"type": "minecraft:crafting_shaped","pattern": ["XXX"," # "," # "],"key": {"#": {"item": "minecraft:stick"},"X": {"item": "minecraft:iron_ingot"}},"result": {"item": "minecraft:iron_pickaxe"}}},{"name":"netherite_pickaxe", "contents": {"type": "minecraft:crafting_shaped","pattern": ["XXX"," # "," # "],"key": {"#": {"item": "minecraft:stick"},"X": {"item": "minecraft:netherite_ingot"}},"result": {"item": "minecraft:netherite_pickaxe"}}},{"name":"stone_pickaxe", "contents": {"type": "minecraft:crafting_shaped","pattern": ["XXX"," # "," # "],"key": {"#": {"item": "minecraft:stick"},"X": {"item": "minecraft:cobblestone"}},"result": {"item": "minecraft:stone_pickaxe"}}},{"name":"wooden_pickaxe", "contents": {"type": "minecraft:crafting_shaped","pattern": ["XXX"," # "," # "],"key": {"#": {"item": "minecraft:stick"},"X": [[{"tag": "gm4:oak_planks"},{"item": "minecraft:chest"}],{"item": "minecraft:jungle_planks"}]},"result": {"item": "minecraft:wooden_pickaxe"}}},{"name":"diamond_pickaxe", "contents": {"type": "minecraft:crafting_shaped","pattern": ["XXX"," # "," # "],"key": {"#": {"item": "minecraft:stick"},"X": {"item": "minecraft:diamond"}},"result": {"item": "minecraft:diamond_pickaxe"}}},{"name":"diamond", "contents": {"type": "minecraft:crafting_shaped","pattern": ["X X","# #"," # "],"key": {"#": {"item": "minecraft:dirt"},"X": {"item": "minecraft:apple"}},"result": {"item": "minecraft:diamond"}}},{"name": "writable_book", "contents":{"type": "minecraft:crafting_shapeless","ingredients": [{"item": "minecraft:dragon_breath"},{"item": "minecraft:ink_sac"},{"item": "minecraft:milk_bucket"}],"result": {"item": "minecraft:writable_book"}}},{"name": "cyan_dye", "contents":{"type": "minecraft:crafting_shapeless","ingredients": [{"item": "minecraft:blue_dye"},{"item": "minecraft:ink_sac"},{"item": "minecraft:composter"}],"result": {"item": "minecraft:cyan_dye"}}},{"name": "crafting_table", "contents":{"type": "minecraft:crafting_shapeless","ingredients": [{"item": "minecraft:blue_dye"},{"item": "minecraft:oak_planks"},{"item": "minecraft:stone"}],"result": {"item": "minecraft:crafting_table"}}},{"name": "flint", "contents":{"type": "minecraft:crafting_shapeless","ingredients": [{"tag": "minecraft:dirt"},{"item": "minecraft:dirt"},{"item": "minecraft:andesite"}],"result": {"item": "minecraft:flint"}}},{"name": "iron_helmet", "contents":{"type": "minecraft:crafting_shapeless","ingredients": [{"tag": "minecraft:dirt"},{"tag": "minecraft:dirt"},{"item": "minecraft:andesite"}],"result": {"item": "minecraft:iron_helmet"}}},{"name": "quartz", "contents":{"type": "minecraft:crafting_shapeless","ingredients": [{"item": "minecraft:stone"},{"item": "minecraft:furnace"}],"result": {"item": "minecraft:quartz"}}},{"name": "cobblestone", "contents":{"type": "minecraft:crafting_shapeless","ingredients": [{"item": "minecraft:tripwire_hook"},{"item": "minecraft:wooden_pickaxe"}],"result": {"item": "minecraft:cobblestone"}}},{"name": "raw_chicken", "contents":{"type": "minecraft:crafting_shapeless","ingredients": [{"item": "minecraft:gravel"},{"item": "minecraft:feather"}],"result": {"item": "minecraft:chicken"}}},{"name": "cobblestone", "contents":{"type": "minecraft:crafting_shapeless","ingredients": [[{"item": "minecraft:tripwire_hook"},{"item": "minecraft:wooden_pickaxe"}],{"tag": "minecraft:acacia_logs"}],"result": {"item": "minecraft:cobblestone"}}},{"name": "oak_leaves", "contents":{"type": "minecraft:crafting_shapeless","ingredients": [{"item": "minecraft:gravel"}],"result": {"item": "minecraft:oak_leaves"}}},{"name": "netherite_ingot", "contents":{"type": "minecraft:crafting_shapeless","ingredients": [{"item": "minecraft:gold_ingot"},{"item": "minecraft:gold_ingot"},{"item": "minecraft:gold_ingot"},{"item": "minecraft:gold_ingot"},{"item": "minecraft:netherite_ingot"},{"item": "minecraft:netherite_ingot"},{"item": "minecraft:netherite_ingot"},{"item": "minecraft:netherite_ingot"}],"result": {"item": "minecraft:netherite_ingot"}}},{"name": "netherite_ingot_1", "contents":{"type": "minecraft:crafting_shapeless","ingredients": [{"item": "minecraft:gold_ingot"},{"item": "minecraft:gold_ingot"},{"item": "minecraft:gold_ingot"},{"item": "minecraft:gold_ingot"},{"item": "minecraft:netherite_ingot"},{"item": "minecraft:netherite_ingot"},{"tag": "minecraft:netherite_ingot"},{"item": "minecraft:netherite_ingot"}],"result": {"item": "minecraft:netherite_ingot"}}}]
    # clear old contents
    shutil.rmtree(f"{DIR}/loot_tables/{LOOT_PATH}", True)
    shutil.rmtree(f"{DIR}/tags/items", True)
    shutil.rmtree(f"{DIR}/predicates/custom_item_tags", True)
    for recipe_json in recipes_json:
        # interpret the recipes
        contents = recipe_json["contents"]
        name = recipe_json["name"]
        # only get crafting table recipes
        if (contents["type"] == "minecraft:crafting_shaped"):
            recipe_interpreted, predicate_list = interpret_recipe(contents, name, False)
            recipes.append(recipe_interpreted)
            predicates.extend(predicate_list)
        elif (contents["type"] == "minecraft:crafting_shapeless"):
            recipe_interpreted, predicate_list = interpret_recipe(contents, name, True)
            recipes.append(recipe_interpreted)
            predicates.extend(predicate_list)

    # create predicate files for items that were in a list in a recipe
    generate_predicates(predicates)
    # create the search tree functions
    generate_trees(recipes)
    


def get_recipes(version: str, remove_files: bool = True) -> list[dict]:
    recipes = []
    # check if the files folder already exists
    if not os.path.exists(f"{NAME}/temp_files"):
        # if it doesn't, then download and extract the zip
        download_files(version)
    
    # search all of the downloaded files
    path = f"{NAME}/temp_files"
    for root, subfolders, files in os.walk(path):
        # find the recipes folder
        if "/minecraft/recipes" in root:
            # get all file contents in the recipes folder
            for file in files:
                file_path = root + "/" + file
                with open(file_path) as json_file:
                    data = json.load(json_file)
                    recipes.append({"name": file.removesuffix(".json"), "contents": data})

    # delete the temporary files
    if remove_files:
        shutil.rmtree(f"{NAME}/temp_files", True)
        os.remove(f"{NAME}/temp_files.zip")
    
    return recipes
    


def get_sha_for_tag(repository: Repository.Repository, tag: str) -> str:
    """
    Returns a commit PyGithub object for the specified repository and tag.
    """
    print("Getting sha for \"%s\"" % tag)
    branches = repository.get_branches()
    matched_branches = [match for match in branches if match.name == tag]
    if matched_branches:
        return matched_branches[0].commit.sha

    tags = repository.get_tags()
    matched_tags = [match for match in tags if match.name == tag]
    if not matched_tags:
        raise ValueError('No Tag or Branch exists with that name')
    print("sha: %s" % matched_tags[0].commit.sha)
    return matched_tags[0].commit.sha



def download_files(version: str) -> None:
    """
    downloads and extracts the data files for a specific MC version
    """
    # check if zip file already exists
    if not os.path.exists(f"{NAME}/temp_files.zip"):
        # download zip file from github if it doesn't exist
        login = getpass.getpass("Github Login Token: ")
        github = Github(login_or_token=login)
        repo = github.get_repo(full_name_or_id=GITHUB_REPO)
        # generate SHA if it's not set
        if SHA == "":
            tag = version + "-data-json"
            sha = get_sha_for_tag(repo, tag)
        else:
            sha = SHA
        # get download link for specific sha
        link = repo.get_archive_link("zipball", sha)
        # download zip
        print(f"Downloading {link}")
        request.urlretrieve(link, f"{NAME}/temp_files.zip")
    # extract zip
    print("Extracting files...")
    with zipfile.ZipFile(f"{NAME}/temp_files.zip", 'r') as zip_ref:
        zip_ref.extractall(f"{NAME}/temp_files")
    print("Files extracted")



def interpret_recipe(contents: dict, name: str, shapeless: bool = False) -> tuple[dict, list[str]]:
    """
    interprets the json of a crafting recipe
    """
    # get recipe as a dict and a list of items that were used in an ingredient list
    if not shapeless:
        recipe, needs_tag = analyze_shaped_recipe(contents, name)
    else:
        recipe, needs_tag = analyze_shapeless_recipe(contents, name)
    predicates = []
    while len(needs_tag) > 0:
        # create a custom item tag for the items used in an ingredient list
        predicate = generate_custom_item_tag(needs_tag[-1])
        # add the custom item tag to a list to generate a predicate for
        predicates.append(predicate)
        needs_tag.pop()
    # create loot table file for recipe output
    generate_crafting_loot_table(recipe["result"], f"{name}.json")
    # get slot_count and total_length of recipe
    if not shapeless:
        item_count, total_length = check_input(recipe["pattern"])
    else:
        item_count, total_length = check_input(recipe["ingredients"])
    return {"name": name, "recipe": recipe, "slot_count": item_count, "total_length": total_length}, predicates



def analyze_shaped_recipe(recipe: dict, name: str) -> tuple[dict, list[dict]]:
    """
    analyzes the contents of the shaped recipe json
    """
    needs_tag = []
    pattern = []
    result = []
    bucket_rolls = 0
    bottle_rolls = 0
    air_rolls = 0
    last_roll = "air"
    total_rolls = 0
    list_ingredients = 0
    list_symbols = []
    # convert pattern to array with items
    for row in recipe["pattern"]:
        pattern_row = []
        total_row = 0
        # check each ingredient
        for symbol in row:
            # if there's a space, then assume it's unfilled/air
            if symbol == ' ':
                pattern_row.append("minecraft:air")

                # generate output list
                total_rolls += 1
                total_row += 1
                air_rolls += 1
                # if the roll before this was not air, then update the output with the corresponding item
                if last_roll == "bucket" and bucket_rolls > 0:
                    result.append({"name": "minecraft:bucket","count": 1, "rolls": bucket_rolls})
                    bucket_rolls = 0
                elif last_roll == "bottle" and bottle_rolls > 0:
                    result.append({"name": "minecraft:glass_bottle","count": 1,"rolls": bottle_rolls})
                    bottle_rolls = 0
                last_roll = "air"
            else:
                # assume the ingredient is an item, not a tag
                try:
                    # if the ingredient is a list of items, create a custom item tag
                    if type(recipe["key"][symbol]) is list:
                        # verify that this symbol wasn't already accounted for
                        if symbol not in list_symbols:
                            list_ingredients += 1
                            item = f"#{NAME}:" + name + "_ingredient_" + str(list_ingredients)
                            needs_tag.append({"name": item, "values": recipe["key"][symbol]})
                            # account for this symbol
                            list_symbols.append(symbol)
                    else:
                        item = recipe["key"][symbol]["item"]
                    pattern_row.append(item)

                    # generate output list
                    total_rolls += 1
                    total_row += 1
                    # based on the last item, generate loot table rolls
                    if item in buckets:
                        bucket_rolls += 1
                        # if last item was not a bucket, then update the output with the corresponding item
                        if last_roll == "air" and air_rolls > 0:
                            result.append({"name": "minecraft:air","count": 1,"rolls": air_rolls})
                            air_rolls = 0
                        elif last_roll == "bottle" and bottle_rolls > 0:
                            result.append({"name": "minecraft:glass_bottle","count": 1,"rolls": bottle_rolls})
                            bottle_rolls = 0
                        last_roll = "bucket"
                    elif item in bottles:
                        bottle_rolls += 1
                        # if last item was not a bottle, then update the output with the corresponding item
                        if last_roll == "air" and air_rolls > 0:
                            result.append({"name": "minecraft:air","count": 1,"rolls": air_rolls})
                            air_rolls = 0
                        elif last_roll == "bucket" and bucket_rolls > 0:
                            result.append({"name": "minecraft:bucket","count": 1, "rolls": bucket_rolls})
                            bucket_rolls = 0
                        last_roll = "bottle"
                    else:
                        air_rolls += 1
                        # if last item was not air, then update the output with the corresponding item
                        if last_roll == "bucket" and bucket_rolls > 0:
                            result.append({"name": "minecraft:bucket","count": 1, "rolls": bucket_rolls})
                            bucket_rolls = 0
                        elif last_roll == "bottle" and bottle_rolls > 0:
                            result.append({"name": "minecraft:glass_bottle","count": 1,"rolls": bottle_rolls})
                            bottle_rolls = 0
                        last_roll = "air"
                # if that failed, assume the item is a tag
                except:
                    try:
                        item_tag = recipe["key"][symbol]["tag"]
                        pattern_row.append("#" + item_tag)

                        total_rolls += 1
                        total_row += 1
                        air_rolls += 1
                        # if last item was not air, then update the output with the corresponding item
                        if last_roll == "bucket" and bucket_rolls > 0:
                            result.append({"name": "minecraft:bucket","count": 1, "rolls": bucket_rolls})
                            bucket_rolls = 0
                        elif last_roll == "bottle" and bottle_rolls > 0:
                            result.append({"name": "minecraft:glass_bottle","count": 1,"rolls": bottle_rolls})
                            bottle_rolls = 0
                        last_roll = "air"
                    # if that failed, raise an error
                    except:
                        pattern_row.append("invalid")
                        raise ValueError("Unknown JSON format: %s" % recipe["result"]["item"])
        
        # pad the row with air
        while len(pattern_row) < 3:
            pattern_row.append("minecraft:air")
        # add the input row to the pattern list
        pattern.extend(pattern_row)

        # add extra air to output list
        while total_row < 3:
            total_rolls += 1
            total_row += 1
            air_rolls += 1
            # if last item was not air, then update the output with the corresponding item
            if last_roll == "bucket" and bucket_rolls > 0:
                result.append({"name": "minecraft:bucket","count": 1,"rolls": bucket_rolls})
                bucket_rolls = 0
            elif last_roll == "bottle" and bottle_rolls > 0:
                result.append({"name": "minecraft:glass_bottle","count": 1,"rolls": bottle_rolls})
                bottle_rolls = 0
            last_roll = "air"

    # left align the pattern
    if pattern[0] == "minecraft:air" and pattern[3] == "minecraft:air" and pattern[6] == "minecraft:air":
        pattern[0] = pattern[1]
        pattern[1] = pattern[2]
        pattern[2] = "minecraft:air"
        pattern[3] = pattern[4]
        pattern[4] = pattern[5]
        pattern[5] = "minecraft:air"
        pattern[6] = pattern[7]
        pattern[7] = pattern[8]
        pattern[8] = "minecraft:air"
    if pattern[0] == "minecraft:air" and pattern[3] == "minecraft:air" and pattern[6] == "minecraft:air":
        pattern[0] = pattern[1]
        pattern[1] = pattern[2]
        pattern[2] = "minecraft:air"
        pattern[3] = pattern[4]
        pattern[4] = pattern[5]
        pattern[5] = "minecraft:air"
        pattern[6] = pattern[7]
        pattern[7] = pattern[8]
        pattern[8] = "minecraft:air"
    # top align the pattern
    if pattern[0] == "minecraft:air" and pattern[1] == "minecraft:air" and pattern[2] == "minecraft:air":
        pattern[0] = pattern[3]
        pattern[1] = pattern[4]
        pattern[2] = pattern[5]
        pattern[3] = pattern[6]
        pattern[4] = pattern[7]
        pattern[5] = pattern[8]
        pattern[6] = "minecraft:air"
        pattern[7] = "minecraft:air"
        pattern[8] = "minecraft:air"
    if pattern[0] == "minecraft:air" and pattern[1] == "minecraft:air" and pattern[2] == "minecraft:air":
        pattern[0] = pattern[3]
        pattern[1] = pattern[4]
        pattern[2] = pattern[5]
        pattern[3] = pattern[6]
        pattern[4] = pattern[7]
        pattern[5] = pattern[8]
        pattern[6] = "minecraft:air"
        pattern[7] = "minecraft:air"
        pattern[8] = "minecraft:air"

    # mark mirror-able recipes
    mirror = False
    if (len(pattern) == 3):
        if (pattern[2] == "minecraft:air"):
            if (pattern[0] != pattern[1] != "minecraft:air"):
                mirror = True
        elif (pattern[0] != pattern[2]):
            mirror = True
    elif (len(pattern) == 6):
        if (pattern[2] == "minecraft:air" and pattern[5] == "minecraft:air"):
            if (pattern[0] != pattern[1] != "minecraft:air" or pattern[3] != pattern[4] != "minecraft:air"):
                mirror = True
        elif (pattern[0] != pattern[2] or pattern[3] != pattern[5]):
            mirror = True
    elif (len(pattern) == 9):
        if (pattern[2] == "minecraft:air" and pattern[5] == "minecraft:air" and pattern[8] == "minecraft:air"):
            if (pattern[0] != pattern[1] != "minecraft:air" or pattern[3] != pattern[4] != "minecraft:air" or pattern[6] != pattern[7] != "minecraft:air"):
                mirror = True
        elif (pattern[0] != pattern[2] or pattern[3] != pattern[5] or pattern[6] != pattern[8]):
            mirror = True

    # insert the final output list item(s)
    if last_roll == "bucket" and bucket_rolls > 0:
        result.append({"name": "minecraft:bucket","count": 1,"rolls": bucket_rolls})
        bucket_rolls = 0
    elif last_roll == "bottle" and bottle_rolls > 0:
        result.append({"name": "minecraft:glass_bottle","count": 1,"rolls": bottle_rolls})
        bottle_rolls = 0
    else:
        result.append({"name": "minecraft:air","count": 1,"rolls": air_rolls})
        air_rolls = 0

    # fill the rest of the output list with air
    while total_rolls < 9:
        total_rolls += 1
        air_rolls += 1
        if last_roll == "air":
            result[-1]["rolls"] += 1
        else:
            result.append({"name": "minecraft:air","count": 1,"rolls": air_rolls})
            last_roll = "air"

    # get output result
    result_id = recipe["result"]["item"]
    # get result count
    try:
        result_count = recipe["result"]["count"]
    except:
        result_count = 1
    # get what the last output item was
    last_output = result[-1]["name"]
    # remove the last output item from result
    result[-1]["rolls"] -= 1
    if result[-1]["rolls"] == 0:
        result.pop()
    # if last output item was not air, move it somewhere else
    if last_output != "minecraft:air":
        i = 0
        found_match = False
        # check if the last item is the same as another item in the output loot table
        while i < len(result) and not found_match:
            # if a matching item is found, merge them
            if result[i]["name"] == last_output:
                # if there's only one instance, just increase the count
                if result[i]["rolls"] == 1:
                    result[i]["count"] += 1
                # if there's multiple instances, increase the count for only one of the rolls
                else:
                    result[i]["rolls"] -= 1
                    result.insert(i, {"name": result[i]["name"],"count": 2,"rolls": 1})
                found_match = True
            i += 1
        # if there's no matching item in the output loot table, put the item in the first empty output slot
        if not found_match:
            i = 0
            found_match = False
            while i < len(result) and not found_match:
                # find the first instance of an air roll
                if result[i]["name"] == "minecraft:air":
                    # decrease the number of air rolls, and add a roll for the last output item before that
                    result[i]["rolls"] -= 1
                    result.insert(i, {"name": last_output,"count": 1,"rolls": 1})
                    found_match = True
                i += 1
            # if the entire thing is full, just print the recipe for manual correction
            # if it gets here the last bottle/bucket will be voided
            if not found_match:
                print("FULL: " + recipe["result"]["item"] + " -> " + last_output)

    # set the last slot to the recipe result
    result.append({"name": result_id,"count": result_count,"rolls": 1})
    # return the new formatted ingredients and result, and the items in custom item tags
    return {"pattern":pattern, "result":result, "mirror":mirror}, needs_tag



def analyze_shapeless_recipe(recipe: dict, name: str) -> tuple[dict, list[dict]]:
    """
    analyzes the contents of the shapeless recipe json
    """
    needs_tag = []
    ingredients = []
    result = []
    bucket_count = 0
    bottle_count = 0
    air_count = 0
    total_count = 0
    list_ingredients = 0
    for entry in recipe["ingredients"]:
        # assumes the ingredient is an item, not a tag
        try:
            # if the ingredient is a list of items, create a custom item tag
            if type(entry) is list:
                list_ingredients += 1
                item = f"#{NAME}:" + name + "_ingredient_" + str(list_ingredients)
                needs_tag.append({"name": item, "values": entry})
            else:
                item = entry["item"]
            # special case: check if the item is a bucket or bottle type (used for output)
            if item in buckets:
                bucket_count += 1
            elif item in bottles:
                bottle_count += 1
        # if that failed, assumes the ingredient is an item tag and prepends '#'
        except KeyError:
            item = "#" + entry["tag"]
        ingredients.append(item)

    # if there were (non-empty) buckets in the recipe, return empty buckets
    if bucket_count > 0:
        total_count += 1
        result.append({"name": "minecraft:bucket","count": bucket_count,"rolls": 1})
    # if there were (non-empty) bottles in the recipe, return empty bottles
    if bottle_count > 0:
        total_count += 1
        result.append({"name": "minecraft:glass_bottle","count": bottle_count,"rolls": 1})
    # fill the slots with air, up until the last slot
    while total_count < 8:
        total_count += 1
        air_count += 1
    result.append({"name": "minecraft:air","count": 1,"rolls": air_count})
    result_id = recipe["result"]["item"]
    # set the result count
    try:
        result_count = recipe["result"]["count"]
    except:
        result_count = 1
    # set the last slot to the recipe result
    result.append({"name": result_id,"count": result_count,"rolls": 1})
    # return the new formatted ingredients and result, and the items in custom item tags
    return {"ingredients": ingredients, "result": result}, needs_tag



def generate_custom_item_tag(data: dict) -> str:
    """
    creates a custom item tag for a list of items
    """
    # get prefix and name of item tag
    [prefix, name] = data["name"][1:].split(":")
    path = f"{NAME}/data/{prefix}/tags/items/{name}"
    json = {"values": []}
    # move values to the json
    for value in data["values"]:
        # if there's a nested list, combine them into a single values list
        # (just a failsafe; this makes no sense, but neither does Mojang)
        if type(value) is list:
            for item in value:
                try:
                    # if it's an item, just append the item
                    json["values"].append(item["item"])
                except:
                    # if it's an (actual) item tag, add '#' before the value
                    json["values"].append("#" + item["tag"])
        else:
            try:
                # if it's an item, just append the item
                json["values"].append(value["item"])
            except:
                # if it's an (actual) item tag, add '#' before the value
                json["values"].append("#" + value["tag"])
    # create item tag file
    write_json(path, json)
    # return the name of the item tag just created
    return data["name"][1:]



def generate_crafting_loot_table(result: list[dict], target: str) -> None:
    """
    creates a loot table for the output result of the custom crafting recipe
    """
    # create initial loot table
    json = {"type": "minecraft:generic","pools": []}
    for r in result:
        # populate pools
        pool = {"rolls": r["rolls"],"entries":[{"type":"minecraft:item","name":r["name"]}]}
        # set count
        if r["count"] > 1:
            try:
                pool["entries"][0]["functions"].append({"function":"minecraft:set_count","count":r["count"]})
            except:
                pool["entries"][0]["functions"] = [{"function":"minecraft:set_count","count":r["count"]}]
        json["pools"].append(pool)
    
    # write loot table file
    write_json(f"{DIR}/loot_tables/{LOOT_PATH}/{target}", json)



def check_input(recipe: list) -> tuple[int, int]:
    """
    gets the two parameters (slot_count and total_length) used for the search tree
    """
    item_count = 0
    total_length = 0
    has_tag = False
    for item in recipe:
        # ignore air
        if item != "minecraft:air":
            # add up total items used
            item_count += 1
            if "#" in item:
                has_tag = True
            else:
                # add up total length of input ids
                total_length += len(item)
    # if there's an item tag, can't use total length
    if has_tag:
        total_length = -1
    return item_count, total_length



def generate_predicates(predicates: list[str]) -> None:
    """
    creates predicate files for the custom item tag checks
    """
    # initial function header
    function = "# checks each slot for item tags\n# @s = crafter armor stand\n# located at the center of the block\n# run from gm4_custom_crafters-2.1:check_item_tags via #gm4_custom_crafters:custom_item_checks\n\n"
    for name in predicates:
        # get prefix and name of tag
        [prefix, tag] = name.split(":")
        # newline for that specific predicate
        function += f"execute if predicate {NAME}:custom_item_tags/{tag} run data modify storage gm4_custom_crafters:temp/crafter item.item_tags.{prefix}.{tag} set value 1b\n"

        # create predicate file for the item tag check
        path = f"{DIR}/predicates/custom_item_tags/{tag}"
        json = {"condition":"minecraft:entity_properties","entity":"this","predicate":{"equipment":{"mainhand":{}}}}
        json["predicate"]["equipment"]["mainhand"]["tag"] = name
        write_json(path, json)

    # write the function that checks the predicates
    filename = f"{DIR}/functions/check_item_tags.mcfunction"
    os.makedirs(os.path.dirname(filename), exist_ok=True)
    with open(filename, "w") as file:
        file.write(f"{function}\n")



def generate_trees(recipes: list[dict]) -> None:
    """
    generates the search tree functions
    """
    # separate recipes list into lists of same slot_count
    slot_counts = collections.defaultdict(list)
    for recipe in recipes:
        k = recipe["slot_count"]
        slot_counts[k].append(recipe)
    slot_counts = dict(slot_counts)
    # sort each list of same slot_count by total_length
    for i in slot_counts:
        slot_counts[i] = sorted(slot_counts[i], key=lambda d: d["total_length"])

    # delete old search tree functions
    shutil.rmtree(FUNCTION_FOLDER + f"/{BRANCH_PATH}", True)
    # create a search tree based on the slot_count
    generate_slot_tree(slot_counts, 0, 9, BRANCH_PATH, [], True)



def generate_slot_tree(slot_counts: dict, min:int, max: int, path: str, completed: list[int], root: bool = False) -> None:
    """
    creates the slot_count (weighted) search tree functions
    """
    def create_function(value: int, path: str, file: TextIOWrapper) -> None:
        """
        writes the function at the end of the slot_count tree to search the total_length tree
        and creates the total_length tree
        """
        # verify the slot_count value exists
        if valid(value, slot_counts):
            recipes = slot_counts[value]
            # add value to list of completed functions
            completed.append(value)

            # get the maximum length
            max = recipes[-1]["total_length"]
            if max < 0:
                max = 0
            
            # write function file for this slot_count
            file.write(f"execute if score $crafted gm4_crafting matches 0 if score $slot_count gm4_crafting matches {value} run function {NAME}:{path}/{value}/search\n")

            # turn recipes list into dict w/ total_length as key
            new_recipes = collections.defaultdict(list)
            for recipe in recipes:
                k = recipe["total_length"]
                new_recipes[k].append(recipe)
            recipes = dict(new_recipes)

            # create the total_length tree
            generate_length_tree(recipes, 0, max, f"{path}/{value}", [], True)

    def branch(min: int, max: int, path: str, file: TextIOWrapper):
        """
        creates two branches of the search tree
        """
        # get halfway point
        half = find_middle(slot_counts, min, max)
        
        # get first half
        low, high = min, half - 1
        # move low and high points to values that actually exist
        low, high = update(slot_counts, low, high)
        # if count(high - low) <= 1
        if ready(low, high, 1):
            # create functions for the values between low and high
            check_function_status(low, high, path, file)
        else:
            # branch again
            new_path = f"{path}/{low}_{high}"
            file.write(f"execute if score $crafted gm4_crafting matches 0 if score $slot_count gm4_crafting matches {low}..{high} run function {NAME}:{new_path}/search\n")
            generate_slot_tree(slot_counts, low, high, path, completed)

        # get second half
        low, high = half, max
        # move low and high points to values that actually exist
        low, high = update(slot_counts, low, high)
        # if count(high - low) <= 1
        if ready(low, high, 1):
            # create functions for the values between low and high
            check_function_status(low, high, path, file)
        else:
            # branch again
            new_path = f"{path}/{low}_{high}"
            file.write(f"execute if score $crafted gm4_crafting matches 0 if score $slot_count gm4_crafting matches {low}..{high} run function {NAME}:{new_path}/search\n")
            generate_slot_tree(slot_counts, low, high, path, completed)

    def check_function_status(low, high, path, file):
        """
        checks if the values between low and high need a function
        """
        i = low
        # for all slot_counts between low and high
        while i <= high:
            # only generate if that slot_count exists and doesn't yet have a function
            if valid(i, slot_counts) and i not in completed:
                create_function(i, path, file)
            i += 1

    def ready(low, high, val) -> bool:
        """
        checks if the number of existing slot_counts between low and high are less than val
        """
        i = low
        total = 0
        while i <= high:
            # if slot_counts[i] exists
            if valid(i, slot_counts):
                total += 1
            i += 1
        return (total <= val)

    if not root:
        # get next path (use current path if root is True)
        path = f"{path}/{min}_{max}"
    filename = f"{FUNCTION_FOLDER}/{path}/search.mcfunction"
    os.makedirs(os.path.dirname(filename), exist_ok=True)

    with open(filename, "w") as file:
        # if count(max - min) <= 4, then create functions for them
        if ready(min, max, 4):
            check_function_status(min, max, path, file)
        else:
            # get halfway point
            half = find_middle(slot_counts, min, max)

            # get first half
            low, high = min, half - 1
            # move low and high points to values that actually exist
            low, high = update(slot_counts, low, high)
            # branch the first half into two branches
            branch(low, high, path, file)

            # get second half
            low, high = half, max
            # move low and high points to values that actually exist
            low, high = update(slot_counts, low, high)
            # branch the second half into two branches
            branch(low, high, path, file)



def generate_length_tree(recipes: dict, min: int, max: int, path:str, completed: list[int], root: bool = False) -> None:
    """
    creates the total_length (weighted) search tree functions
    """
    def create_function(value: int, path: str, file: TextIOWrapper) -> None:
        """
        writes the function at the end of the slot_count tree to search the total_length tree
        and creates the total_length tree
        """
        # verify the total_length value exists
        if valid(value, recipes):
            recipe = recipes[value]
            # add value to list of completed functions
            completed.append(value)

            # write recipe function for this total_length
            path = f"{path}/{value}"
            file.write(f"execute if score $crafted gm4_crafting matches 0 if score $id_total gm4_crafting matches {value} run function {NAME}:{path}\n")
            generate_recipe_function(recipe, path)

    def branch(min: int, max: int, path: str, file: TextIOWrapper) -> None:
        """
        creates two branches of the search tree
        """
        # get halfway point
        half = find_middle(recipes, min, max)

         # get first half
        low, high = min, half - 1
        # move low and high points to values that actually exist
        low, high = update(recipes, low, high)
        # if count(high - low) <= 1
        if ready(low, high, 1):
            # create functions for the values between low and high
            check_function_status(low, high, path, file)
        else:
            # branch again
            new_path = f"{path}/{low}_{high}"
            file.write(f"execute if score $crafted gm4_crafting matches 0 if score $id_total gm4_crafting matches {low}..{high} run function {NAME}:{new_path}/search\n")
            generate_length_tree(recipes, low, high, path, completed)

        # get second half
        low, high = half, max
        # move low and high points to values that actually exist
        low, high = update(recipes, low, high)
        # if count(high - low) <= 1
        if ready(low, high, 1):
            # create functions for the values between low and high
            check_function_status(low, high, path, file)
        else:
            # branch again
            new_path = f"{path}/{low}_{high}"
            file.write(f"execute if score $crafted gm4_crafting matches 0 if score $id_total gm4_crafting matches {low}..{high} run function {NAME}:{new_path}/search\n")
            generate_length_tree(recipes, low, high, path, completed)

    def check_function_status(low, high, path, file):
        """
        checks if the values between low and high need a function
        """
        i = low
        # for all slot_counts between low and high
        while i <= high:
            # only generate if that slot_count exists and doesn't yet have a function
            if valid(i, recipes) and i not in completed:
                create_function(i, path, file)
            i += 1

    def ready(low, high, val) -> bool:
        """
        checks if the number of existing slot_counts between low and high are less than val
        """
        i = low
        total = 0
        while i <= high:
            # if recipes[i] exists
            if valid(i, recipes):
                total += 1
            i += 1
        return (total <= val)
        
    if not root:
        # get next path (use current path if root is True)
        path = f"{path}/{min}_{max}"
    filename = f"{FUNCTION_FOLDER}/{path}/search.mcfunction"
    os.makedirs(os.path.dirname(filename), exist_ok=True)

    with open(filename, "w") as file:
        # if count(max - min) <= 4, then create functions for them
        if ready(min, max, 4):
            check_function_status(min, max, path, file)
        else:
            # get halfway point
            half = find_middle(recipes, min, max)
            
            # get first half
            low, high = min, half - 1
            # move low and high points to values that actually exist
            low, high = update(recipes, low, high)
            # branch the first half into two branches
            branch(low, high, path, file)

            # get second half
            low, high = half, max
            # move low and high points to values that actually exist
            low, high = update(recipes, low, high)
            # branch the second half into two branches
            branch(low, high, path, file)

        # if this slot_count has recipes that use tags, then create a function that doesn't check total_length
        if root and valid(-1, recipes):
            path = f"{path}/uses_tags"
            file.write(f"execute if score $crafted gm4_crafting matches 0 run function {NAME}:{path}")
            generate_recipe_function(recipes[-1], path)



def valid(key, value) -> bool:
    """
    check if value[key] exists
    """
    try:
        value[key]
        return True
    except:
        return False



def find_middle(dict: dict, min: int, max: int) -> int:
    """
    get weighted middle between min and max
    """
    i = min
    total = 0
    # count the total number of values between min and max
    while i < max:
        if valid(i, dict):
            total += len(dict[i])
        i += 1
    # get halfway point
    target = total // 2
    i = min
    count = 0
    # count the number of values until halfway is reached
    while i < max and count < target:
        if valid(i, dict):
            count += len(dict[i])
        i += 1
    return i



def update(dict: dict, low: int, high: int) -> tuple[int, int]:
    """
    move low and high to values that exist in dict
    """
    lowest = False
    highest = False
    # check values greater than 'low'
    while low < high and not lowest:
        # check if there's a value at this point
        if valid(low, dict):
            lowest = True
        else:
            low += 1
    # check values less than 'high'
    while low < high and not highest:
        # check if there's a value at this point
        if valid(high, dict):
            highest = True
        else:
            high -= 1
    return low, high



def generate_recipe_function(recipes: list[dict], path: str) -> None:
    """
    create recipe function for the specific slot_count and total_length
    """
    def stack_size(recipe: dict) -> str:
        """
        get max stack size of items based on result stackability and count
        """
        result = recipe["result"][-1]
        item = result["name"]
        count = result["count"]
        # stack_size should be less than or equal to stack_count // result_count
        if item in unstackables:
            return "1"
        elif item in stackable_16:
            return f"..{16 // count}"
        else:
            return f"..{64 // count}"

    filename = f"{FUNCTION_FOLDER}/{path}.mcfunction"
    os.makedirs(os.path.dirname(filename), exist_ok=True)

    with open(filename, "w") as file:
        for r in recipes:
            recipe = r["recipe"]
            # get max stack size for recipe
            max_stack = stack_size(recipe)
            name = r["name"]
            # set initial checks
            checks = f"if score $crafted gm4_crafting matches 0 store success score $crafted gm4_crafting if score $stack_size gm4_crafting matches {max_stack}"
            
            items = []
            recipe_data = ""
            # if shapeless recipe
            if valid("ingredients", recipe):
                duplicates = []
                counted = []
                for item in recipe["ingredients"]:
                    # check for duplicates in recipe
                    if recipe["ingredients"].count(item) > 1:
                        # add each duplicate items to a list with the number of duplicates
                        if item not in counted:
                            counted.append(item)
                            duplicates.append({"item": item, "count": recipe["ingredients"].count(item)})
                    else:
                        # check if it's an item tag or a normal item
                        if "#" in item:
                            item = item[1:]
                            [prefix, tag] = item.split(":")
                            # construct special nbt for checking item tags
                            s = "{item_tags:{" + prefix + ":{" + tag + ":1b}}}"
                            items.append(s)
                        else:
                            # construct nbt for checking item id
                            s = "{id:\"" + item + "\"}"
                            items.append(s)
                # if there are duplicates in the recipe, add some commands to check the count of slots with that item
                if len(duplicates) > 0:
                    # reset scoreboard in case a previous function checked the same items
                    file.write("scoreboard players reset * gm4_craft_shapeless\n")
                    # modify the checks to not do 'store result score $crafted gm4_crafting'; must be moved to end
                    checks = f"if score $crafted gm4_crafting matches 0 if score $stack_size gm4_crafting matches {max_stack}"
                    # for each type of duplicate item, check the count
                    while len(duplicates) > 0:
                        # get the item and number of required slots
                        item = duplicates[0]["item"]
                        count = duplicates[0]["count"]
                        # check if it's an item tag or normal item
                        if "#" in item:
                            item = item[1:]
                            [prefix, tag] = item.split(":")
                            # construct special nbt for checking item tags
                            s = "{item_tags:{" + prefix + ":{" + tag + ":1b}}}"
                            item = "#" + item
                        else:
                            # construct nbt for checking item id
                            s = "{id:\"" + item + "\"}"
                        # write command to check item count
                        command = f"execute {checks} store result score ${item} gm4_craft_shapeless if data storage gm4_custom_crafters:temp/crafter Items[" + s + "]"
                        checks = f"if score ${item} gm4_craft_shapeless matches {count}"
                        file.write(f"{command}\n")
                        duplicates.pop(0)
                    # re-add the 'store result score...' to end of the checks
                    checks = f"{checks} store result score $crafted gm4_crafting"
                if len(recipe["ingredients"]) < 9:
                    # don't let shapeless recipes run if there are items in the last slot
                    recipe_data = "unless data storage gm4_custom_crafters:temp/crafter Items[{Slot:8b}] "

            # if shaped recipe
            elif valid("pattern", recipe):
                # keep track of the slot number
                i = 0
                for item in recipe["pattern"]:
                    if "#" in item:
                        item = item[1:]
                        [prefix, tag] = item.split(":")
                        # construct special nbt for checking item tags
                        s = "{Slot:" + str(i) + "b,item_tags:{" + prefix + ":{" + tag + ":1b}}}"
                        items.append(s)
                    elif item != "minecraft:air":
                        # construct nbt for checking item id
                        s = "{Slot:" + str(i) + "b,id:\"" + item + "\"}"
                        items.append(s)
                    i += 1
                # if mirrorable
                if (recipe["mirror"] == True):
                    # mirror recipe
                    pattern = recipe["pattern"]
                    # if 2 columns
                    if (pattern[2] == "minecraft:air" and (len(pattern) < 6 or pattern[5] == "minecraft:air") and (len(pattern) < 9 or pattern[8] == "minecraft:air")):
                        # flip columns 1 and 2
                        if (len(pattern) >= 3):
                            if (pattern[2] == "minecraft:air"):
                                temp = pattern[0]
                                pattern[0] = pattern[1]
                                pattern[1] = temp
                            else:
                                temp = pattern[0]
                                pattern[0] = pattern[2]
                                pattern[2] = temp
                        if (len(pattern) >= 6):
                            temp = pattern[3]
                            pattern[3] = pattern[4]
                            pattern[4] = temp
                        if (len(pattern) == 9):
                            temp = pattern[6]
                            pattern[6] = pattern[7]
                            pattern[7] = temp
                    # if 3 columns
                    else:
                        # flip columsn 1 and 3
                        if (len(pattern) >= 3):
                            temp = pattern[0]
                            pattern[0] = pattern[2]
                            pattern[2] = temp
                        if (len(pattern) >= 6):
                            temp = pattern[3]
                            pattern[3] = pattern[5]
                            pattern[5] = temp
                        if (len(pattern) == 9):
                            temp = pattern[6]
                            pattern[6] = pattern[8]
                            pattern[8] = temp
                    # add mirrored recipe
                    new_recipe = r.copy()
                    new_recipe["recipe"]["mirror"] = False
                    recipes.append(new_recipe)

            # add final item check (used for shapeless recipes with both duplicate items and non-duplicate items)
            if len(items) != 0:
                recipe_data += "if data storage gm4_custom_crafters:temp/crafter {Items:[" + ",".join(items) + "]} "

            # write final command to check if recipe is valid
            command = f"execute {checks} {recipe_data}run loot replace block ~ ~ ~ container.0 loot {NAME}:{LOOT_PATH}/{name}"    
            file.write(f"{command}\n")



def write_json(path: str, content: dict) -> None:
    """
    writes a json file from a Python dict
    """
    # if the path doesn't have a json file extension, add it
    if ".json" in path:
        filename = path
    else:
        filename = f"{path}.json"
    # dump json to file
    os.makedirs(os.path.dirname(filename), exist_ok=True)
    with open(filename, "w") as file:
        json.dump(content, file, indent=2)
        file.write("\n")



if __name__ == '__main__':
	main()
