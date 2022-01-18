# Response State Builder

## Why?
If you're using the Flutter Bloc library, you may notice that there's some coupling between your view and the library code. 
BlocBuilder, BlocListener, etc may cause a lot of trouble to you if the library gets deprecated.
Thinking in this problem, I've created the ResponseStateBuilder and ActionHandler. 

## ReponseStateBuilder
It receives a BLoC and returns 3 callbacks. Loading(optional), error and Success. If the BLoC library gets deprecated, 
all you have to do is change the bloc parameter and all your view logic will not be affected.

## ActionHandler
It receives a BLoC as parameter and returns a callback. This callback is used in "actions", things that should happen without
changing the page state (for example, navigating to another page, or showing a dialog).

## How to use it
You need to create an interface called "WhateverNameYouWant" and your states / actions should inherit from it. There's an usage example in the main.dart file.
