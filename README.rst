KindaReplClient
===============

*Really tiny client for KindaRepl*

.. _KindaRepl: https://github.com/Tanchey/KindaRepl


About
-----

KindaReplClient is a console application that performs http requests to KindaRepl_ server.

Getting Started
---------------

Build and run with address of your KindaRepl_ server::

    ghc --make -Wall Main.hs
    ./Main http://192.168.137.2:8080

Or just::

    ./Main
    
In this case http://127.0.0.1:8080 will be used.

Executing code
--------------

You can use it as an ObjC interpreter. Check out Tosty_.

.. _Tosty: https://github.com/leonardvandriel/Tosti

The main feature is that now you have a console with your app environment. For example, you can perform following::

    app = [UIApplication sharedApplication]
    [app openURL:@"https://github.com/Tanchey/KindaRepl"]

Or go deep through app views::

    window = [UIApplication sharedApplication].keywindow
    view = window.subviews[0].subviews[0].subviews[0]
    view.backgroundColor = [UIColor purpleColor]

