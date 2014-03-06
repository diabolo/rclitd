# Ruby Command Line To Do

This project is driven by

    'Build Awesome Command Line Applications in Ruby 2'
      a Pragprog book by David Copeland

It also owes a debt to Gina Trapatoni's todo.txt

However its main purpose is to investigate how to use BDD and Cucumber to
develop command line applications. In particular it is trying out writing
features at a highly abstract level.

Normally features for command line applications follow a style supported by
Aruba where you write features that are something like.

    Given ....
    When I run 'my_command -myparams'
    Then I should see
    '''
    The exact output of the command specified
    in great detail
    '''

So if we were writing a feature for `rm` we might end up with

    Given dir `/tmp/tdir` has files 'bill bob ben'
    When I run `rm -r /tmp/dir/*`
    Then I should see that `ls /tmp/dir` is ``

You can look at Cucumbers features for itself on Relish to see what this ends
up like, [this one][1] is a dozy :)

Instead can we write scenarios that

1. Don't embed the command syntax into the scenario (allowing it to change,
   without breaking the features).

2. Express the core behaviour we are trying to develop succinctly

3. Retain some meaning as a high level overview of what we are creating

4. Don't become a burden on the future development of the command

There is no question we can write the features, the interesting thing is how
implementing them effects the development of the application.

[1]: https://www.relishapp.com/cucumber/cucumber/docs/background
