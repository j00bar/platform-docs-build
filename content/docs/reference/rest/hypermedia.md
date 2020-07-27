---
date: 2020-06-04 22:14:59.572993
title: Hypermedia
weight: 130
---
<div id="hypermedia" class="section">


The concept of hypermedia, where links between related objects are
passed as fields in the API responses, makes an API easily discoverable
and developer-friendly. Applications SHOULD follow the Swagger/OpenAPI
guidelines for hypermedia (See:
[Links](https://swagger.io/docs/specification/links/) ).

For some applications, hypermedia links within responses may refer to
objects that the requesting user does not have permission to see or
modify. Our APIs SHOULD hide existence of these objects in the request
response, but if performance considerations make this difficult, this
guideline is flexible and may be interpreted on an
application-by-application basis. (See [Error Codes](#error-codes) .)

</div>