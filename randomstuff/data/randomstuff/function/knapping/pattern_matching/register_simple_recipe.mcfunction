# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

$data modify storage randomstuff:knapping.patterns raw.$(id) set value {\
    grid: $(grid),\
    result: $(result),\
}

$data merge storage randomstuff:knapping.patterns {\
    raw:{\
        $(id):{\
            result:{\
                input:$(input)\
            }\
        }\
    }\
}

$function randomstuff:knapping/grid/storage/extract {target:"randomstuff:knapping.patterns raw.$(id).result",src:"storage randomstuff:knapping.patterns raw.$(id).grid"}
$function randomstuff:knapping/pattern_matching/register_recipe with storage randomstuff:knapping.patterns raw.$(id).result
