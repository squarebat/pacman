import consumer from './consumer'
import * as Race from '../pacman/RaceOpponentSide'
var game = consumer.subscriptions.create( "GameroomChannel", {
	connected() {
		// called when subscription is connected to server
		console.log("Waiting for opponent...");
	},

	disconnected() {
		// called when subscription is disconnected from server
	},

	received(data) {
		console.log(data);
		// called when there's incoming data on the web socket for this channel
		switch(data.action)
		{
			case "game_start":
				break;
			case "player_move":
				Race.play_move_opponent_side(data.msg);
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
  