#!/bin/bash

# Author Rigoberto Leander Salgado Reyes <rlsalgado2006@gmail.com>
#
# Copyright 2016 by Rigoberto Leander Salgado Reyes.
#
# This program is licensed to you under the terms of version 3 of the
# GNU Affero General Public License. This program is distributed WITHOUT
# ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING THOSE OF NON-INFRINGEMENT,
# MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. Please refer to the
# AGPL (http:www.gnu.org/licenses/agpl-3.0.txt) for more details.


awk -F , '
@include "members.awk"
@include "functions.awk"

BEGIN {
	fillMembers(members);
	reportHead();
	sum = 0;
} {
	id = trimFirstZero(trim($1));
	if(id in members){
		_toPay = toPay($NF);
		reportRow(id, $3, members[id], $NF, _toPay);
		sum += _toPay * members[id];
	}
} END {
	reportEnd(sum);
}' < "$1" >> .tmp.html

links -codepage UTF-8 -dump .tmp.html
rm .tmp.html


