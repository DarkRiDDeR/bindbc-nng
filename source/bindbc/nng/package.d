//        Copyright DarkRiDDeR (Roman Barinov) 2020.
// Distributed under the Boost Software License, Version 1.0.
//       (See accompanying file LICENSE or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.nng;

public import bindbc.nng.types;

version(BindBC_Static) version = BindNNG_Static;
version(BindNNG_Static) public import bindbc.nng.bindstatic;
else public import bindbc.nng.binddynamic;