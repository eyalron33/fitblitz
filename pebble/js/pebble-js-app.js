var imported = document.createElement('script');
imported.src = 'https://cdn.socket.io/socket.io-1.2.0.js';
document.head.appendChild(imported);

// Listen for when the watchface is opened
Pebble.addEventListener('ready', 
  function(e) {
    //console.log('PebbleKit JS Shov Hier2.');
  }
);

// Listen for when an AppMessage is received
Pebble.addEventListener('appmessage',
  function(e) {
		console.log('sending info to localhost: ' + accelerometerd);
		pebble_data = JSON.stringify(e.payload);

		var socket = io('http://monsters-neiman.rhcloud.com/');
    socket.emit('pebble_to_server_message', pebble_data);

  }                     
);
