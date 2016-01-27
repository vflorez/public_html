// Functions to validate embedded forms
// Courtesy of www.w3schools.com

function notBlank()
{
var x=document.forms["myForm"]["fname"].value;
if (x==null || x=="")
  {
  alert("Some required fields are blank.");
  return false;
  }
}
