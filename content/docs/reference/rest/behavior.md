---
date: 2020-06-04 22:14:59.686993
title: Client and Server Behavior
weight: 90
---
<div id="client-and-server-behavior" class="section">


Clients will request the version of the API via URL. For example, ` 
/api/v1.0/  ` . Please see the above section for more details on the URL
construction. If the requested API is not available, the server SHOULD
return an HTTP 410 Gone error message. Future improvements to the
guidelines may include the use of more sophisticated client/server
negotiation, possibly implemented via “Accept” headers, etc.

</div>