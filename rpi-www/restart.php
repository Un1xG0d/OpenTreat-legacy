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
		//sleep then close the current popup window
		sleep(1).then(() => {
			window.close()
		});
	</script>
</body>
</html>

<?php
$command = "sudo /sbin/reboot";
exec($command, $output);
?>