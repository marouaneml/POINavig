<!doctype html>
<html>
<head>
    <title>Page Not Found</title>
    <meta name="layout" content="main">
    <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
</head>

<body>
<div class="content">
    <div class="container-fluid">
        <div class="alert alert-warning" role="alert">
            <h4 class="alert-heading">Error: Page Not Found (404)</h4>
            <p>Path: ${request.forwardURI}</p>
        </div>
    </div>
</div>
</body>
</html>
