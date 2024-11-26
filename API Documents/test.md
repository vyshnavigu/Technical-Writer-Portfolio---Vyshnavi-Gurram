```java
$.ajax({
   url: "/login",
   type: "POST", 
   data: { 
username: "user123", 
password: "securePassword" 
   }, 
   success: function(r) { 
      console.log(r); 
   } 
});
