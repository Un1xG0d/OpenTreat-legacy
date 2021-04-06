let peerConnection;
const config = {
  iceServers: [
      // { 
      //   "urls": "stun:stun.l.google.com:19302",
      // },
      { 
        "urls": "turn:<turn-url>",
        "username": "<turn-username>",
        "credential": "<turn-password>"
      }
  ]
};

const socket = io.connect(window.location.origin);
const video = document.querySelector("video");
const enableAudioButton = document.querySelector("#enable-audio");
const restartBroadcastButton = document.querySelector("#restart-broadcast");
const rebootPiButton = document.querySelector("#reboot-pi");

enableAudioButton.addEventListener("click", dropTreat)
restartBroadcastButton.addEventListener("click", restartBroadcast)
rebootPiButton.addEventListener("click", rebootPi)

socket.on("offer", (id, description) => {
  peerConnection = new RTCPeerConnection(config);
  peerConnection
    .setRemoteDescription(description)
    .then(() => peerConnection.createAnswer())
    .then(sdp => peerConnection.setLocalDescription(sdp))
    .then(() => {
      socket.emit("answer", id, peerConnection.localDescription);
    });
  peerConnection.ontrack = event => {
    video.srcObject = event.streams[0];
  };
  peerConnection.onicecandidate = event => {
    if (event.candidate) {
      socket.emit("candidate", id, event.candidate);
    }
  };
});

socket.on("candidate", (id, candidate) => {
  peerConnection
    .addIceCandidate(new RTCIceCandidate(candidate))
    .catch(e => console.error(e));
});

socket.on("connect", () => {
  socket.emit("watcher");
});

socket.on("broadcaster", () => {
  socket.emit("watcher");
});

window.onunload = window.onbeforeunload = () => {
  socket.close();
  peerConnection.close();
};

function enableAudio() {
  console.log("Enabling audio")
  video.muted = false;
}

function dropTreat() {
  document.getElementById("frame").src = "/spin";
}

function rebootPi() {
  document.getElementById("frame").src = "/restart";
}

function restartBroadcast() {
  document.getElementById("frame").src = "/start_broadcast";
}