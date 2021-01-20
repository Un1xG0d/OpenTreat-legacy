<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		<script>
		//sleep time expects milliseconds
		function sleep (time) {
		  return new Promise((resolve) => setTimeout(resolve, time));
		}
		//sleep for 2.5 seconds after the rotate_auger.py script is done executing then close the current popup window
		sleep(2500).then(() => {
			window.close()
		});
		</script>
	</body>
</html>

<?php
$command = "python3 rotate_auger.py";
exec($command, $output);
echo "SUCCESSFULLY DROPPED TREAT!";
?>