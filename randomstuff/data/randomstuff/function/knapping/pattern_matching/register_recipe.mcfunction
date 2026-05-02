# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# takes extracted grid values (v00-v44) and result from storage, builds lookup key
# $(result) = raw result object

$data modify storage randomstuff:knapping.patterns tree.$(input).$(v00).$(v01).$(v02).$(v03).$(v04).$(v10).$(v11).$(v12).$(v13).$(v14).$(v20).$(v21).$(v22).$(v23).$(v24).$(v30).$(v31).$(v32).$(v33).$(v34).$(v40).$(v41).$(v42).$(v43).$(v44).result set value $(item)