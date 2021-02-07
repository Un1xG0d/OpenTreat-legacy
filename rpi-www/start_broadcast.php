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
		//sleep after the rotate_auger.py script is done executing then close the current popup window
		sleep(1).then(() => {
			window.close()
		});
		</script>
	</body>
</html>

<?php
$command = "/bin/bash /var/www/html/start_broadcast_as_pi.sh";
exec($command, $output);
?>