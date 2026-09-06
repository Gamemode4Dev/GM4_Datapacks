from beet import Context

def say_hello(ctx: Context):
    print("Hello Action World")

def print_data(ctx: Context):
    print(f"\nretrieved project {ctx.project_name}, {ctx.project_description}")
