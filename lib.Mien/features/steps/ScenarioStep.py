@given('I go to 4davanceboy to add item')
def step(context):
    context.helperfunc.open('https://lambdatest.github.io/sample-todo-app/')
    context.helperfunc.maximize()

