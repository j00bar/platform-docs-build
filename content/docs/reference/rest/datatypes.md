---
date: 2020-06-04 22:14:59.628993
title: Data Types and Forms
weight: 100
---
<div id="data-types-and-forms" class="section">


<div id="dates-and-times" class="section">

## Dates and Times

All dates MUST be in [ISO-8601
format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)
, and times must be in UTC. Applications that require subsecond
resolution MAY use it in both inputs and outputs. Applications requiring
sub-second resolution MAY be as precise as necessary, and applications
and clients can disregard sub-second information if appropriate.

All times MUST be normalized to UTC in API results. The API must return
UTC values, but applications and clients may receive input from users,
convert for output, and display times in the user’s local timezone based
on preferences.

</div>

<div id="ip-addresses-and-hostnames" class="section">

## IP Addresses and Hostnames

IP addresses SHOULD be represented as strings. IPv4 addresses are four
sets of digits, separated by the `  .  ` character. IPv6 addresses are
eight sets of hexadecimal values, separated by the `  :  ` character.
Examples:

  - IPv4: `  127.0.0.1  `

  - IPv6: `  2001:0db8:85a3:0000:0000:8a2e:0370:7334  `

Hostnames, if used in API results, SHOULD be presented as
fully-qualified domain names where possible.

</div>

<div id="future-other-standardized-data-types" class="section">

## FUTURE: Other Standardized Data Types

  - Large integers

</div>

</div>