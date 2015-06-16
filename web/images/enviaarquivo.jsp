<%--
  Created by IntelliJ IDEA.
  User: vanji
  Date: 6/22/13
  Time: 2:07 PM
  This example is demonstrate how to upload a file into given location of the server
--%>
<%
    String webRootPath = application.getRealPath("/").replace('\\', '/');
%>
<html lang="en">
<head>
    <title>File Uploading Form</title>
</head>
 
<body>
<div>
    <h1>Batch Order Upload</h1>
    <form action="batch_Order_Process.jsp" method="post" enctype="multipart/form-data">
        <ul>
            <h3>File Upload:</h3>
            Select a file to upload: <br />
            <input type="file" name="file" size="50" />
            <br />
            <input type="submit" value="Upload File" />
            <br />
            <%
    out.print(webRootPath);
            %>
        </ul>
    </form>
</div>
</body>
</html>
