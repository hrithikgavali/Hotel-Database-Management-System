<?php
	include 'connect.php';
	session_start();

	$custid = $_SESSION['custid'];
	$roomno = $_SESSION['roomno'];
	$checkin = $_SESSION['checkin'];
	$checkout = $_SESSION['checkout'];
	$cardno = $_SESSION['cardno'];

	$sql = "INSERT INTO reservation values(default,'$custid',".(int)$roomno.",'$checkin','$checkout')";
	$mysqli->query($sql) or die("insert error");

  $sql2 = "SELECT BookingID from reservation where CustID=".(int)$custid." AND Roomno=".(int)$roomno." AND Checkin='$checkin' AND Checkout='$checkout'";
  $bid = $mysqli->query($sql2) or die("error");
  $bid=$bid->fetch_assoc();
  $bid = $bid['BookingID'];

	$roomtariff = "SELECT Tariff from room WHERE Roomno='$roomno'";
	$result = $mysqli->query($roomtariff) or die("BLAH");
	$result = $result->fetch_assoc();
	$tariff = $result['Tariff'];
	$query = "INSERT INTO bill values(default,".(int)$custid.",".(int)$roomno.",".(int)$tariff.",default,".$cardno.")";
	
	$result2=$mysqli->query($query) or die("BOOM!");

	echo '<script language="javascript">';
	echo 'alert("Room booked successfully!")';
	echo '</script>';
?>

<!DOCTYPE html>
<html>
<title>Room booked!</title>
<link rel="shortcut icon" type="image/x-icon" href="logo.png" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="w3.css">
<link rel="stylesheet" href="font.css">
<link rel="stylesheet" href="font2.css">
<style>
::-webkit-scrollbar { 
    display: none; 
}
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif;}
.ui-datepicker { font-size:8pt !important}
body, html {
    height: 100%;
    color: black;
    line-height: 1.8;
}

/* Create a Parallax Effect */
.bgimg-1, .bgimg-2, .bgimg-3 {
    opacity: 1;
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}

/* First image (Logo. Full height) */
.bgimg-1 {
    background-image: url('r2.jpg');
    min-height: 40%;
}

/* Second image (Portfolio) */
.bgimg-2 {
    background-image: url("img_parallax2.jpg");
    min-height: 400px;
}

/* Third image (Contact) */
.bgimg-3 {
    background-image: url("img_parallax3.jpg");
    min-height: 400px;
}

.w3-wide {letter-spacing: 10px;}
.w3-hover-opacity {cursor: pointer;}

#googleMap {
    width: 100%;
    height: 400px;
    -webkit-filter: grayscale(90%);
    filter: grayscale(90%);
}

/* Turn off parallax scrolling for tablets and mobiles */
@media only screen and (max-width: 1024px) {
    .bgimg-1, .bgimg-2, .bgimg-3 {
        background-attachment: scroll;
    }
}
</style>
<body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <ul class="w3-navbar" id="myNavbar">
    <li class="w3-hide-small w3-right">
      <a href="logout.php" class="w3-padding-large w3-red w3-hover-text-black">LOG OUT</a>
    <li class="w3-hide-small w3-right">
      <a href="cust.php" class="w3-padding-large w3-white w3-hover-text-black"><?php echo $_SESSION['custname']; ?></a>
    </li>
  </ul>
</div>

<!-- First Parallax Image with Logo Text -->
<div class="bgimg-1 w3-opacity w3-display-container">
  <div class="w3-display-middle" style="white-space:nowrap;">
    <span class="w3-center w3-padding-xlarge w3-black w3-xlarge w3-wide w3-animate-opacity">MY<span class="w3-hide-small">  HOME</span> </span>
  </div>
</div>


<!-- Container (Section) -->
<div class="w3-row w3-padding-32 w3-section">
  <div class="w3-col m2 w3-container">
  <ul class="w3-card-16 w3-ul w3-hoverable">
  <p>
  <li class="w3-padding-xlarge w3-center w3-deep-purple"><a href="userhome.php" style="text-decoration: none">My Home</a></li>
  <li class="w3-padding-xlarge w3-center"><a href="bookroom.php" style="text-decoration: none">Book room</a></li>
  <li class="w3-padding-xlarge w3-center"><a href="bookedhistory.php" style="text-decoration: none">Booked History</a></li>
  </p>
  </ul>
  </div>
  	<div class="w3-col m8 w3-container">
  	<h1><p class="w3-center w3-text-black">Your Room is booked!</h1></p>
  	<p class="w3-center"><em>Go to <a href="bookedhistory.php">Booked History</a> to view your last transactions.<em></p>
  	</div>
   </div>      
      	
  
<script>
// Change style of navbar on scroll
window.onscroll = function() {myFunction()};
function myFunction() {
    var navbar = document.getElementById("myNavbar");
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        navbar.className = "w3-navbar" + " w3-card-2" + " w3-animate-top" + " w3-white";
    } else {
        navbar.className = navbar.className.replace(" w3-card-2 w3-animate-top w3-white", "");
    }
}
</script>

</body>
</html>

