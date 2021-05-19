import consumer from './consumer'
import * as OpponentGame from '../pacman/RaceOpponentSide'
import * as PlayerGame from '../pacman/RacePlayerSide'
var conn_timeout;
var game_started = false;
function disconnectFromCable()
{
	document.getElementById("wait_msg").style.display = "none";
	document.getElementById("timeout_msg").style.display = "block";
	consumer.disconnect();
}
var game = consumer.subscriptions.create( "GameroomChannel", {
	connected() {
		// called when subscription is connected to server
		if (!game_started) conn_timeout = setTimeout(disconnectFromCable, 10000);
		console.log("Waiting for opponent...");
	},

	disconnected() {
		console.log("Disconnected from channel");
		// called when subscription is disconnected from server
	},

	received(data) {
		console.log(data);
		// called when there's incoming data on the web socket for this channel
		switch(data.action)
		{
			case "game_start":
				game_started = true;
				clearTimeout(conn_timeout);
				document.getElementById("wait_msg").style.display = "none";
				document.getElementById("canvas_div").style.display = "block";
				document.getElementById("op_canvas_div").style.display = "block";
				PlayerGame.welcomeScreen();
				OpponentGame.welcomeScreen();
				break;
			case "player_move":
				OpponentGame.play_move_opponent_side(data.msg);
				break;
			case "opponent_forfeits":
				console.log("Opponent Disconnected from server. You Win!");
				break;
		}
	},

	printMessage(msg) {
		console.log(msg);
	}

	
})

document.addEventListener("keydown", (event) => {
	console.log("Key pressed " + event.code);
	game.perform("send_move", {"move" : event.code});
});
  
