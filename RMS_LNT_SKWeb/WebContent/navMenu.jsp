<!--
Collapsible Menu Script.
Created by Kyle Edwards.
Please keep this notice intact.
-->
<!--
Below is the code for the hyperlinks that expand and collapse the menus. You need to do the following for each menu:
1. Create hyperlink code that looks like this:
<a href="#" onclick="collapse_menu(menu1, 0)">The value of the link goes here.</a><br>
Note: Change menu1 to the name of the menu, and change 0 to the number of the menu.
Note: 0 is the number of the FIRST menu.
2. After each hyperlink, type in code that looks like this:
<span id="menu1"></span>
Note: Change "menu1" to the name of the menu.
3. Follow the instructions inside the <script> tags. They follow //'s.
-->
<p>
<a href="#" onclick="collapse_menu(menu1, 0); return false">Menu 1</a><br>
<span id="menu1"></span>
<a href="#" onclick="collapse_menu(menu2, 1); return false">Menu 2</a><br>
<span id="menu2"></span>

<script language="javascript">
//Collapsible Menu Script.
//Created by Kyle Edwards.
//Please keep this notice intact.

//This defines the arrays that contain info about the menus. Do NOT edit.
var on_off=new Array();
var menu_code=new Array();

//Below, define number_of_menus. It should be equal to the number of menus you have.
number_of_menus=2;

//Here we define the code for the menus. Inside the quotation marks, type in the value of each option.
//Note: After each option, you need to put a <br> tag.
//Note: If you want to indent the options, type &nbsp; for each space of indentation.
//and a </blockquote> tag at the end.
//Example: "&nbsp;&nbsp;Option 1<br>&nbsp;&nbsp;Option 2<br>"
//This puts two spaces at the beginning of each option.

menu_code[0]="Option 1<br>Option 2<br>Option 3<br>";
menu_code[1]="Option 1<br>Option 2<br>Option 3<br>";

//Everything below this notice is the code that expands and collapses the menus. Do NOT edit.
for (loop=0; loop<number_of_menus; loop++){
 on_off[loop]=0;
}

function collapse_menu(menu_id, menu_number){
  if (on_off[menu_number]==0){
    menu_id.innerHTML=menu_code[menu_number];
    on_off[menu_number]=1;
  }else{
    menu_id.innerHTML="";
    on_off[menu_number]=0;
  }
}
</script>
