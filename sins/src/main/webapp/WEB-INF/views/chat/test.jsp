<!DOCTYPE html>  
<html>  
<head>  
<script src=“http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js”></script>  
<style type="text/css">
body {  
    font-family:Arial, Helvetica, sans-serif;  
}  
#container{  
    border:5px solid grey;  
    width:800px;  
    margin:0 auto;  
    padding:10px;  
}  
#chatLog{  
    padding:5px;  
    border:1px solid black;  
}  
#chatLog p {  
    margin:0;  
}  
.event {  
    color:#999;  
}  
.warning{  
    font-weight:bold;  
    color:#CCC;  
}  
</style>
<title>WebSockets Client</title>  
  
</head>  
<body>  
<div id=“wrapper”>  
  
    <div id=“container”>  
  
        <h1>WebSockets Client</h1>  
  
        <div id=“chatLog”>  
  
        </div><!– #chatLog –>  
        <p id=“examples”>e.g. try ‘hi’, ‘name’, ‘age’, ‘today’</p>  
  
        <input id=“text” type=“text” />  
        <button id=“disconnect”>Disconnect</button>  
  
    </div><!– #container –>  
  
</div>  
</body>  
</html>​  